param(
    [string]$TexFile = "manuscript\mah_route_indicator_friction_model.tex",
    [string]$OutputName,
    [ValidateSet("pdflatex", "xelatex")]
    [string]$Engine = "pdflatex",
    [switch]$Clean,
    [switch]$KeepBuild
)

$ErrorActionPreference = "Stop"

function Assert-UnderPath {
    param(
        [Parameter(Mandatory = $true)][string]$Path,
        [Parameter(Mandatory = $true)][string]$RootPath
    )

    $full = [System.IO.Path]::GetFullPath($Path)
    $rootFull = [System.IO.Path]::GetFullPath($RootPath)
    if (-not $rootFull.EndsWith([System.IO.Path]::DirectorySeparatorChar)) {
        $rootFull = $rootFull + [System.IO.Path]::DirectorySeparatorChar
    }

    if (-not $full.StartsWith($rootFull, [System.StringComparison]::OrdinalIgnoreCase)) {
        throw "Path is outside expected root: $full"
    }
}

function Remove-PathWithRetry {
    param(
        [Parameter(Mandatory = $true)][string]$Path,
        [int]$MaxRetries = 5,
        [int]$DelayMs = 300
    )

    for ($i = 1; $i -le $MaxRetries; $i++) {
        try {
            if (Test-Path -LiteralPath $Path) {
                Remove-Item -LiteralPath $Path -Recurse -Force -ErrorAction Stop
            }
            return
        }
        catch {
            if ($i -eq 1) {
                Grant-CurrentUserFullControl -Path $Path
            }
            if ($i -eq $MaxRetries) {
                throw "Failed to delete path after $MaxRetries attempts: $Path`n$($_.Exception.Message)"
            }
            Start-Sleep -Milliseconds $DelayMs
        }
    }
}

function Grant-CurrentUserFullControl {
    param(
        [Parameter(Mandatory = $true)][string]$Path
    )

    if (!(Test-Path -LiteralPath $Path)) {
        return
    }

    $identity = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
    $grantRule = if ((Get-Item -LiteralPath $Path -Force).PSIsContainer) {
        "${identity}:(OI)(CI)F"
    }
    else {
        "${identity}:F"
    }

    & icacls $Path /grant $grantRule /T /C 2>$null | Out-Null
}

function Copy-FileWithRetry {
    param(
        [Parameter(Mandatory = $true)][string]$Source,
        [Parameter(Mandatory = $true)][string]$Destination,
        [int]$MaxRetries = 5,
        [int]$DelayMs = 300
    )

    for ($i = 1; $i -le $MaxRetries; $i++) {
        try {
            Copy-Item -LiteralPath $Source -Destination $Destination -Force -ErrorAction Stop
            return
        }
        catch {
            if ($i -eq $MaxRetries) {
                throw "Failed to overwrite target file after $MaxRetries attempts: $Destination`n$($_.Exception.Message)`nTip: close PDF viewers or editor preview tabs that may lock this file."
            }
            Start-Sleep -Milliseconds $DelayMs
        }
    }
}

function Invoke-NativeCommand {
    param(
        [Parameter(Mandatory = $true)][string]$Command,
        [Parameter(Mandatory = $true)][string[]]$Arguments
    )

    & $Command @Arguments
    if ($LASTEXITCODE -ne 0) {
        throw "$Command failed with exit code $LASTEXITCODE"
    }
}

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$workspaceRoot = Split-Path -Parent $scriptDir
$buildRoot = Join-Path $scriptDir "build"
$outputDir = Join-Path $scriptDir "output"

$miktexCandidates = @(
    "D:\application\miktex\miktex\bin\x64",
    "D:\application\miktex\miktex\bin",
    "D:\application\miktex\bin\x64",
    "D:\application\miktex\bin"
)
foreach ($candidate in $miktexCandidates) {
    if (Test-Path -LiteralPath $candidate) {
        if (-not ($env:Path -split ';' | Where-Object { $_ -eq $candidate })) {
            $env:Path = "$candidate;$env:Path"
        }
    }
}

$texCandidates = if ([System.IO.Path]::IsPathRooted($TexFile)) {
    @($TexFile)
}
else {
    @(
        (Join-Path $scriptDir $TexFile),
        (Join-Path $workspaceRoot $TexFile)
    )
}

$texPath = $null
foreach ($candidate in $texCandidates) {
    $fullCandidate = [System.IO.Path]::GetFullPath($candidate)
    if (Test-Path -LiteralPath $fullCandidate) {
        $texPath = $fullCandidate
        break
    }
}

if ([string]::IsNullOrWhiteSpace($texPath)) {
    throw "TeX file not found: $TexFile"
}
if ([System.IO.Path]::GetExtension($texPath).ToLowerInvariant() -ne ".tex") {
    throw "TexFile must be a .tex file: $texPath"
}
Assert-UnderPath -Path $texPath -RootPath $scriptDir

$sourceDir = Split-Path -Parent $texPath
$baseName = [System.IO.Path]::GetFileNameWithoutExtension($texPath)
$workDir = Join-Path $buildRoot $baseName
$targetName = if ([string]::IsNullOrWhiteSpace($OutputName)) {
    "$baseName.pdf"
}
elseif ($OutputName.ToLowerInvariant().EndsWith(".pdf")) {
    $OutputName
}
else {
    "$OutputName.pdf"
}
$targetPdf = Join-Path $outputDir $targetName
$builtPdf = Join-Path $workDir "$baseName.pdf"

Assert-UnderPath -Path $workDir -RootPath $buildRoot
Assert-UnderPath -Path $targetPdf -RootPath $outputDir

if (!(Get-Command $Engine -ErrorAction SilentlyContinue)) {
    throw "LaTeX engine not found on PATH: $Engine"
}

if (!(Test-Path -LiteralPath $buildRoot)) {
    New-Item -ItemType Directory -Path $buildRoot | Out-Null
}
if (!(Test-Path -LiteralPath $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir | Out-Null
}

if (Test-Path -LiteralPath $workDir) {
    Remove-PathWithRetry -Path $workDir
}
New-Item -ItemType Directory -Path $workDir | Out-Null

if ($Clean -and (Test-Path -LiteralPath $targetPdf)) {
    Remove-PathWithRetry -Path $targetPdf
}

$oldBibInputs = $env:BIBINPUTS
$oldBstInputs = $env:BSTINPUTS
$oldTexInputs = $env:TEXINPUTS
$env:BIBINPUTS = if ([string]::IsNullOrWhiteSpace($oldBibInputs)) { $sourceDir } else { "$sourceDir;$oldBibInputs" }
$env:BSTINPUTS = if ([string]::IsNullOrWhiteSpace($oldBstInputs)) { $sourceDir } else { "$sourceDir;$oldBstInputs" }
$env:TEXINPUTS = if ([string]::IsNullOrWhiteSpace($oldTexInputs)) { $sourceDir } else { "$sourceDir;$oldTexInputs" }

try {
    $latexmk = Get-Command latexmk -ErrorAction SilentlyContinue
    if ($latexmk) {
        $latexmkMode = if ($Engine -eq "xelatex") { "-xelatex" } else { "-pdf" }
        Push-Location $sourceDir
        try {
            Invoke-NativeCommand -Command "latexmk" -Arguments @(
                $latexmkMode,
                "-interaction=nonstopmode",
                "-halt-on-error",
                "-file-line-error",
                "-outdir=$workDir",
                $texPath
            )
        }
        finally {
            Pop-Location
        }
    }
    else {
        Push-Location $sourceDir
        try {
            Invoke-NativeCommand -Command $Engine -Arguments @(
                "-interaction=nonstopmode",
                "-halt-on-error",
                "-file-line-error",
                "-output-directory",
                $workDir,
                $texPath
            )
        }
        finally {
            Pop-Location
        }

        $auxPath = Join-Path $workDir "$baseName.aux"
        if ((Test-Path -LiteralPath $auxPath) -and (Select-String -LiteralPath $auxPath -Pattern "\\bibdata" -Quiet)) {
            if (!(Get-Command bibtex -ErrorAction SilentlyContinue)) {
                throw "BibTeX is required but not found on PATH."
            }

            Push-Location $workDir
            try {
                Invoke-NativeCommand -Command "bibtex" -Arguments @($baseName)
            }
            finally {
                Pop-Location
            }
        }

        for ($i = 1; $i -le 2; $i++) {
            Push-Location $sourceDir
            try {
                Invoke-NativeCommand -Command $Engine -Arguments @(
                    "-interaction=nonstopmode",
                    "-halt-on-error",
                    "-file-line-error",
                    "-output-directory",
                    $workDir,
                    $texPath
                )
            }
            finally {
                Pop-Location
            }
        }
    }
}
finally {
    $env:BIBINPUTS = $oldBibInputs
    $env:BSTINPUTS = $oldBstInputs
    $env:TEXINPUTS = $oldTexInputs
}

if (!(Test-Path -LiteralPath $builtPdf)) {
    throw "Build failed: output PDF not found: $builtPdf"
}

Copy-FileWithRetry -Source $builtPdf -Destination $targetPdf

if (!$KeepBuild) {
    Remove-PathWithRetry -Path $workDir
}

Write-Output "Build succeeded. PDF written to: $targetPdf"
if ($KeepBuild) {
    Write-Output "Intermediate files kept in: $workDir"
}
