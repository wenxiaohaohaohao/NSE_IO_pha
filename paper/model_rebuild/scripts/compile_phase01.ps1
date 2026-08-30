[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$modelRebuild = Split-Path -Parent $PSScriptRoot
$auditRoot = Join-Path $modelRebuild 'audit'
$wrapper = Join-Path $auditRoot 'phase01_compile_wrapper.tex'
$buildRoot = Join-Path $auditRoot 'build_phase01'
$tempRoot = Join-Path $modelRebuild 'tmp\phase01'
$compiler = 'D:\application\miktex\miktex\bin\x64\pdflatex.exe'
$compileLog = Join-Path $auditRoot 'phase01_compile_console.txt'

if (-not (Test-Path -LiteralPath $compiler)) {
    throw "MiKTeX compiler not found: $compiler"
}

New-Item -ItemType Directory -Force -Path $buildRoot | Out-Null
New-Item -ItemType Directory -Force -Path $tempRoot | Out-Null
$env:TEMP = $tempRoot
$env:TMP = $tempRoot

$allOutput = [System.Collections.Generic.List[string]]::new()
Push-Location $auditRoot
try {
    foreach ($pass in 1..2) {
        $savedErrorActionPreference = $ErrorActionPreference
        $ErrorActionPreference = 'Continue'
        $output = @(
            & $compiler `
                -interaction=nonstopmode `
                -halt-on-error `
                -file-line-error `
                "-output-directory=$buildRoot" `
                $wrapper 2>&1
        )
        $compilerExitCode = $LASTEXITCODE
        $ErrorActionPreference = $savedErrorActionPreference
        foreach ($line in $output) { $allOutput.Add([string]$line) }
        if ($compilerExitCode -ne 0) {
            [System.IO.File]::WriteAllLines($compileLog, $allOutput, [System.Text.UTF8Encoding]::new($false))
            throw "Phase 1 LaTeX pass $pass failed with exit code $compilerExitCode"
        }
    }
} finally {
    Pop-Location
}

[System.IO.File]::WriteAllLines($compileLog, $allOutput, [System.Text.UTF8Encoding]::new($false))

$pdf = Join-Path $buildRoot 'phase01_compile_wrapper.pdf'
$latexLog = Join-Path $buildRoot 'phase01_compile_wrapper.log'
if (-not (Test-Path -LiteralPath $pdf)) { throw "Expected PDF missing: $pdf" }
if (-not (Test-Path -LiteralPath $latexLog)) { throw "Expected LaTeX log missing: $latexLog" }

$logText = [System.IO.File]::ReadAllText($latexLog, [System.Text.Encoding]::UTF8)
$fatalPatterns = @(
    '! LaTeX Error:',
    'Fatal error occurred',
    'There were undefined references',
    'multiply defined'
)
$found = @($fatalPatterns | Where-Object { $logText.Contains($_) })
if ($found.Count -gt 0) {
    throw "Phase 1 LaTeX log audit failed: $($found -join '; ')"
}

Write-Output "PHASE01_LATEX=PASS"
Write-Output "PDF=$pdf"
Write-Output "LATEX_LOG=$latexLog"
Write-Output "CONSOLE_LOG=$compileLog"
Write-Output "TEMP=$tempRoot"
