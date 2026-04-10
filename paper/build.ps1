param(
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
                # Reset attribute flags before delete to avoid read-only surprises.
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
                throw "Failed to overwrite target file after $MaxRetries attempts: $Destination`n$($_.Exception.Message)`nTip: close PDF viewers or VS Code preview tabs that may lock this file."
            }
            Start-Sleep -Milliseconds $DelayMs
        }
    }
}

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$srcDir = Join-Path $scriptDir "src"
$buildDir = Join-Path $scriptDir "build"
$mainTex = Join-Path $srcDir "main.tex"

# Prefer explicit MiKTeX install paths, then fall back to PATH.
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

if (!(Test-Path $mainTex)) {
    throw "main.tex not found: $mainTex"
}

if (!(Test-Path $buildDir)) {
    New-Item -ItemType Directory -Path $buildDir | Out-Null
}

Push-Location $buildDir
try {
    if ($Clean) {
        $cleanPatterns = @(
            "*.aux", "*.bbl", "*.bcf", "*.blg", "*.fls", "*.fdb_latexmk", "*.idx", "*.ilg", "*.ind",
            "*.lof", "*.lot", "*.log", "*.nav", "*.out", "*.run.xml", "*.snm", "*.synctex.gz", "*.toc",
            "*.xdv", "*.dvi", "*.ps", "*.pdf"
        )

        foreach ($pattern in $cleanPatterns) {
            Get-ChildItem -Path $buildDir -File -Filter $pattern -ErrorAction SilentlyContinue |
                ForEach-Object { Remove-FileWithRetry -Path $_.FullName }
        }
    }

    $latexmk = Get-Command latexmk -ErrorAction SilentlyContinue
    if ($latexmk) {
        & latexmk -pdf -interaction=nonstopmode -halt-on-error -file-line-error -outdir="$buildDir" "$mainTex"
    }
    else {
        & pdflatex -interaction=nonstopmode -halt-on-error -file-line-error -output-directory "$buildDir" "$mainTex"
        & bibtex (Join-Path $buildDir "main")
        & pdflatex -interaction=nonstopmode -halt-on-error -file-line-error -output-directory "$buildDir" "$mainTex"
        & pdflatex -interaction=nonstopmode -halt-on-error -file-line-error -output-directory "$buildDir" "$mainTex"
    }
}
finally {
    Pop-Location
}

$builtPdf = Join-Path $buildDir "main.pdf"
if (Test-Path $builtPdf) {
    $targetPdf = "D:\working_paper\DANNI\output\doc\MAH_Policy.pdf"
    Copy-FileWithRetry -Source $builtPdf -Destination $targetPdf
    Remove-FileWithRetry -Path $builtPdf
    Write-Output "Build succeeded. PDF synced to: $targetPdf"
}
else {
    throw "Build failed: main.pdf not found in $buildDir"
}
