[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$modelRebuild = Split-Path -Parent $PSScriptRoot
$auditRoot = Join-Path $modelRebuild 'audit'
$buildRoot = Join-Path $auditRoot 'build_phase16'
$tempRoot = Join-Path $modelRebuild 'tmp\phase16_compile'
$compiler = 'D:\application\miktex\miktex\bin\x64\pdflatex.exe'
$consoleLog = Join-Path $auditRoot 'phase16_compile_console.txt'
$sources = @(
    '13_main_text_model_candidate.tex',
    '14_appendix_model_candidate.tex'
)

if (-not (Test-Path -LiteralPath $compiler -PathType Leaf)) {
    throw "Required compiler missing: $compiler"
}
foreach ($sourceName in $sources) {
    $sourcePath = Join-Path $modelRebuild $sourceName
    if (-not (Test-Path -LiteralPath $sourcePath -PathType Leaf)) {
        throw "Required source missing: $sourcePath"
    }
}

New-Item -ItemType Directory -Force -Path $buildRoot | Out-Null
New-Item -ItemType Directory -Force -Path $tempRoot | Out-Null
$env:TEMP = $tempRoot
$env:TMP = $tempRoot

$output = [Collections.Generic.List[string]]::new()
$results = [Collections.Generic.List[string]]::new()
Push-Location $modelRebuild
try {
    foreach ($sourceName in $sources) {
        foreach ($pass in 1..2) {
            $output.Add("===== $sourceName pass $pass =====")
            $saved = $ErrorActionPreference
            $ErrorActionPreference = 'Continue'
            $lines = @(& $compiler -interaction=nonstopmode -halt-on-error -file-line-error "-output-directory=$buildRoot" $sourceName 2>&1)
            $exitCode = $LASTEXITCODE
            $ErrorActionPreference = $saved
            foreach ($line in $lines) { $output.Add([string]$line) }
            if ($exitCode -ne 0) {
                [IO.File]::WriteAllLines(
                    $consoleLog,$output,[Text.UTF8Encoding]::new($false)
                )
                throw "$sourceName LaTeX pass $pass failed with exit code $exitCode"
            }
        }

        $stem = [IO.Path]::GetFileNameWithoutExtension($sourceName)
        $pdf = Join-Path $buildRoot "$stem.pdf"
        $latexLog = Join-Path $buildRoot "$stem.log"
        foreach ($path in @($pdf,$latexLog)) {
            if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
                throw "Expected candidate output missing: $path"
            }
        }
        $logText = [IO.File]::ReadAllText(
            $latexLog,[Text.Encoding]::UTF8
        )
        $fatalPatterns = @(
            '! LaTeX Error:',
            'Fatal error occurred',
            'There were undefined references',
            'multiply defined'
        )
        $fatal = @(
            $fatalPatterns | Where-Object { $logText.Contains($_) }
        )
        if ($fatal.Count -gt 0) {
            throw "$sourceName LaTeX audit failed: $($fatal -join '; ')"
        }
        $boxes = @(
            [regex]::Matches(
                $logText,'(?m)^(Overfull|Underfull) \[hv]box'
            )
        ).Count
        $results.Add(
            "PHASE16_LATEX=PASS source=$sourceName box_warnings=$boxes pdf=$pdf"
        )
    }
} finally {
    Pop-Location
}

[IO.File]::WriteAllLines(
    $consoleLog,$output,[Text.UTF8Encoding]::new($false)
)
foreach ($result in $results) { Write-Output $result }
Write-Output "CONSOLE_LOG=$consoleLog"
Write-Output "TEMP=$tempRoot"
