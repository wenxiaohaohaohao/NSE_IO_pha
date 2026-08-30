[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [ValidateRange(1, 18)]
    [int]$Phase
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$modelRebuild = Split-Path -Parent $PSScriptRoot
$auditRoot = Join-Path $modelRebuild 'audit'
$phaseTag = '{0:D2}' -f $Phase
$wrapper = Join-Path $auditRoot "phase${phaseTag}_compile_wrapper.tex"
$buildRoot = Join-Path $auditRoot "build_phase${phaseTag}"
$tempRoot = Join-Path $modelRebuild "tmp\phase${phaseTag}"
$compiler = 'D:\application\miktex\miktex\bin\x64\pdflatex.exe'
$compileLog = Join-Path $auditRoot "phase${phaseTag}_compile_console.txt"

if (-not (Test-Path -LiteralPath $compiler -PathType Leaf)) {
    throw "MiKTeX compiler not found: $compiler"
}
if (-not (Test-Path -LiteralPath $wrapper -PathType Leaf)) {
    throw "Phase wrapper not found: $wrapper"
}

New-Item -ItemType Directory -Force -Path $buildRoot | Out-Null
New-Item -ItemType Directory -Force -Path $tempRoot | Out-Null
$env:TEMP = $tempRoot
$env:TMP = $tempRoot

$allOutput = [System.Collections.Generic.List[string]]::new()
Push-Location $auditRoot
try {
    foreach ($pass in 1..2) {
        $savedPreference = $ErrorActionPreference
        $ErrorActionPreference = 'Continue'
        $output = @(
            & $compiler `
                -interaction=nonstopmode `
                -halt-on-error `
                -file-line-error `
                "-output-directory=$buildRoot" `
                $wrapper 2>&1
        )
        $exitCode = $LASTEXITCODE
        $ErrorActionPreference = $savedPreference
        foreach ($line in $output) { $allOutput.Add([string]$line) }
        if ($exitCode -ne 0) {
            [System.IO.File]::WriteAllLines($compileLog, $allOutput, [System.Text.UTF8Encoding]::new($false))
            throw "Phase $Phase LaTeX pass $pass failed with exit code $exitCode"
        }
    }
} finally {
    Pop-Location
}

[System.IO.File]::WriteAllLines($compileLog, $allOutput, [System.Text.UTF8Encoding]::new($false))

$pdf = Join-Path $buildRoot "phase${phaseTag}_compile_wrapper.pdf"
$latexLog = Join-Path $buildRoot "phase${phaseTag}_compile_wrapper.log"
if (-not (Test-Path -LiteralPath $pdf -PathType Leaf)) { throw "Expected PDF missing: $pdf" }
if (-not (Test-Path -LiteralPath $latexLog -PathType Leaf)) { throw "Expected LaTeX log missing: $latexLog" }

$logText = [System.IO.File]::ReadAllText($latexLog, [System.Text.Encoding]::UTF8)
$fatalPatterns = @('! LaTeX Error:', 'Fatal error occurred', 'There were undefined references', 'multiply defined')
$found = @($fatalPatterns | Where-Object { $logText.Contains($_) })
if ($found.Count -gt 0) {
    throw "Phase $Phase LaTeX log audit failed: $($found -join '; ')"
}

$boxWarnings = @([regex]::Matches($logText, '(?m)^(Overfull|Underfull) \\[hv]box')).Count
Write-Output "PHASE_LATEX=PASS phase=$Phase box_warnings=$boxWarnings"
Write-Output "PDF=$pdf"
Write-Output "LATEX_LOG=$latexLog"
Write-Output "CONSOLE_LOG=$compileLog"
Write-Output "TEMP=$tempRoot"
