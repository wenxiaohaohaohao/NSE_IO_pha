param(
    [Parameter(Mandatory = $true)]
    [string]$TexFile,
    [string]$OutputName,
    [switch]$Clean
)

$ErrorActionPreference = "Stop"

function Remove-FileWithRetry {
    param(
        [Parameter(Mandatory = $true)][string]$Path,
        [int]$MaxRetries = 5,
        [int]$DelayMs = 300
    )

    for ($i = 1; $i -le $MaxRetries; $i++) {
        try {
            if (Test-Path $Path) {
                (Get-Item $Path -Force).Attributes = 'Archive'
                Remove-Item -Path $Path -Force -ErrorAction Stop
            }
            return
        }
        catch {
            if ($i -eq $MaxRetries) {
                throw "Failed to delete file after $MaxRetries attempts: $Path`n$($_.Exception.Message)"
            }
            Start-Sleep -Milliseconds $DelayMs
        }
    }
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
            Copy-Item -Path $Source -Destination $Destination -Force -ErrorAction Stop
            return
        }
        catch {
            if ($i -eq $MaxRetries) {
                throw "Failed to overwrite target file after $MaxRetries attempts: $Destination`n$($_.Exception.Message)"
            }
            Start-Sleep -Milliseconds $DelayMs
        }
    }
}

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$workspaceRoot = Split-Path -Parent $scriptDir
$buildDir = Join-Path $scriptDir "build"
$outputDir = Join-Path $workspaceRoot "output\doc"

$texPath = if ([System.IO.Path]::IsPathRooted($TexFile)) {
    $TexFile
}
else {
    Join-Path $workspaceRoot $TexFile
}
$texPath = [System.IO.Path]::GetFullPath($texPath)

if (!(Test-Path $texPath)) {
    throw "TeX file not found: $texPath"
}
if ([System.IO.Path]::GetExtension($texPath).ToLowerInvariant() -ne ".tex") {
    throw "TexFile must be a .tex file: $texPath"
}

$miktexCandidates = @(
    "D:\application\miktex\miktex\bin\x64",
    "D:\application\miktex\miktex\bin",
    "D:\application\miktex\bin\x64",
    "D:\application\miktex\bin"
)
foreach ($p in $miktexCandidates) {
    if (Test-Path $p) {
        if (-not ($env:Path -split ';' | Where-Object { $_ -eq $p })) {
            $env:Path = "$p;$env:Path"
        }
    }
}

if (!(Test-Path $buildDir)) {
    New-Item -ItemType Directory -Path $buildDir | Out-Null
}
if (!(Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir | Out-Null
}

$baseName = [System.IO.Path]::GetFileNameWithoutExtension($texPath)
if ($Clean) {
    $cleanPatterns = @(
        "$baseName.aux", "$baseName.bbl", "$baseName.bcf", "$baseName.blg", "$baseName.fdb_latexmk",
        "$baseName.fls", "$baseName.idx", "$baseName.ilg", "$baseName.ind", "$baseName.lof", "$baseName.lot",
        "$baseName.log", "$baseName.nav", "$baseName.out", "$baseName.run.xml", "$baseName.snm",
        "$baseName.synctex.gz", "$baseName.toc", "$baseName.xdv", "$baseName.dvi", "$baseName.ps", "$baseName.pdf"
    )

    foreach ($name in $cleanPatterns) {
        $target = Join-Path $buildDir $name
        Remove-FileWithRetry -Path $target
    }
}

$latexmk = Get-Command latexmk -ErrorAction SilentlyContinue
if ($latexmk) {
    & latexmk -xelatex -interaction=nonstopmode -halt-on-error -file-line-error -outdir="$buildDir" "$texPath"
}
else {
    & xelatex -interaction=nonstopmode -halt-on-error -file-line-error -output-directory "$buildDir" "$texPath"
    & xelatex -interaction=nonstopmode -halt-on-error -file-line-error -output-directory "$buildDir" "$texPath"
}

$builtPdf = Join-Path $buildDir ($baseName + ".pdf")
if (!(Test-Path $builtPdf)) {
    throw "Build failed: output PDF not found: $builtPdf"
}

if ([string]::IsNullOrWhiteSpace($OutputName)) {
    $targetName = $baseName + ".pdf"
}
else {
    $targetName = if ($OutputName.ToLowerInvariant().EndsWith('.pdf')) { $OutputName } else { "$OutputName.pdf" }
}

$targetPdf = Join-Path $outputDir $targetName
Copy-FileWithRetry -Source $builtPdf -Destination $targetPdf
Remove-FileWithRetry -Path $builtPdf
Write-Output "Build succeeded. PDF synced to: $targetPdf"