param(
    [switch]$Clean
)

$ErrorActionPreference = "Stop"

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
        Get-ChildItem -File | Where-Object { $_.Extension -in ".aux", ".bbl", ".blg", ".log", ".out", ".toc", ".fdb_latexmk", ".fls" } | Remove-Item -Force
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
    Copy-Item -Path $builtPdf -Destination $targetPdf -Force
    Write-Output "Build succeeded. PDF synced to: $targetPdf"
}
else {
    throw "Build failed: main.pdf not found in $buildDir"
}
