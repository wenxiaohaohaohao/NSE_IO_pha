[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$modelRebuild = Split-Path -Parent $PSScriptRoot
$auditRoot = Join-Path $modelRebuild 'audit'
$source = Join-Path $modelRebuild '12_full_derivation_draft.tex'
$buildRoot = Join-Path $auditRoot 'build_phase15_full'
$tempRoot = Join-Path $modelRebuild 'tmp\phase15_full'
$compiler = 'D:\application\miktex\miktex\bin\x64\pdflatex.exe'
$consoleLog = Join-Path $auditRoot 'phase15_full_compile_console.txt'

foreach ($path in @($source,$compiler)) {
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        throw "Required file missing: $path"
    }
}
New-Item -ItemType Directory -Force -Path $buildRoot | Out-Null
New-Item -ItemType Directory -Force -Path $tempRoot | Out-Null
$env:TEMP = $tempRoot
$env:TMP = $tempRoot

$output = [Collections.Generic.List[string]]::new()
Push-Location $modelRebuild
try {
    foreach ($pass in 1..2) {
        $saved = $ErrorActionPreference
        $ErrorActionPreference = 'Continue'
        $lines = @(& $compiler -interaction=nonstopmode -halt-on-error -file-line-error "-output-directory=$buildRoot" $source 2>&1)
        $exitCode = $LASTEXITCODE
        $ErrorActionPreference = $saved
        foreach ($line in $lines) { $output.Add([string]$line) }
        if ($exitCode -ne 0) {
            [IO.File]::WriteAllLines($consoleLog,$output,[Text.UTF8Encoding]::new($false))
            throw "Full draft LaTeX pass $pass failed with exit code $exitCode"
        }
    }
} finally {
    Pop-Location
}
[IO.File]::WriteAllLines($consoleLog,$output,[Text.UTF8Encoding]::new($false))

$pdf = Join-Path $buildRoot '12_full_derivation_draft.pdf'
$latexLog = Join-Path $buildRoot '12_full_derivation_draft.log'
foreach ($path in @($pdf,$latexLog)) {
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        throw "Expected full-draft output missing: $path"
    }
}
$logText = [IO.File]::ReadAllText($latexLog,[Text.Encoding]::UTF8)
$fatalPatterns = @(
    '! LaTeX Error:','Fatal error occurred',
    'There were undefined references','multiply defined'
)
$fatal = @($fatalPatterns | Where-Object { $logText.Contains($_) })
if ($fatal.Count -gt 0) {
    throw "Full draft LaTeX audit failed: $($fatal -join '; ')"
}
$boxes = @([regex]::Matches($logText,'(?m)^(Overfull|Underfull) \\[hv]box')).Count
Write-Output "PHASE15_FULL_LATEX=PASS box_warnings=$boxes"
Write-Output "PDF=$pdf"
Write-Output "LATEX_LOG=$latexLog"
Write-Output "CONSOLE_LOG=$consoleLog"
Write-Output "TEMP=$tempRoot"
