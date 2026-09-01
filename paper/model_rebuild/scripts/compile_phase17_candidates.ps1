[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference='Stop'
$modelRebuild=Split-Path -Parent $PSScriptRoot
$auditRoot=Join-Path $modelRebuild 'audit'
$buildRoot=Join-Path $auditRoot 'build_phase17'
$tempRoot=Join-Path $modelRebuild 'tmp\phase17_compile'
$compiler='D:\application\miktex\miktex\bin\x64\pdflatex.exe'
$consoleLog=Join-Path $auditRoot 'phase17_compile_console.txt'
$sources=@(
  '13_main_text_model_candidate.tex',
  '14_appendix_model_candidate.tex',
  '12_full_derivation_draft.tex'
)

if(-not (Test-Path -LiteralPath $compiler -PathType Leaf)){
  throw "Required compiler missing: $compiler"
}
$resolvedModel=[IO.Path]::GetFullPath($modelRebuild)
$resolvedBuild=[IO.Path]::GetFullPath($buildRoot)
if(-not $resolvedBuild.StartsWith($resolvedModel,[StringComparison]::OrdinalIgnoreCase)){
  throw "Unsafe Phase 17 build path: $resolvedBuild"
}
if(Test-Path -LiteralPath $buildRoot){
  Remove-Item -LiteralPath $buildRoot -Recurse -Force
}
New-Item -ItemType Directory -Force -Path $buildRoot,$tempRoot|Out-Null
$env:TEMP=$tempRoot
$env:TMP=$tempRoot
$output=[Collections.Generic.List[string]]::new()
$results=[Collections.Generic.List[string]]::new()

Push-Location $modelRebuild
try{
  foreach($sourceName in $sources){
    $sourcePath=Join-Path $modelRebuild $sourceName
    if(-not (Test-Path -LiteralPath $sourcePath -PathType Leaf)){
      throw "Required source missing: $sourcePath"
    }
    $stable=$false
    foreach($pass in 1..5){
      $output.Add("===== $sourceName pass $pass =====")
      $saved=$ErrorActionPreference
      $ErrorActionPreference='Continue'
      $lines=@(& $compiler -interaction=nonstopmode -halt-on-error -file-line-error "-output-directory=$buildRoot" $sourceName 2>&1)
      $exitCode=$LASTEXITCODE
      $ErrorActionPreference=$saved
      foreach($line in $lines){$output.Add(([string]$line).TrimEnd())}
      if($exitCode -ne 0){
        [IO.File]::WriteAllLines($consoleLog,$output,[Text.UTF8Encoding]::new($false))
        throw "$sourceName LaTeX pass $pass failed with exit code $exitCode"
      }
      $stem=[IO.Path]::GetFileNameWithoutExtension($sourceName)
      $latexLog=Join-Path $buildRoot "$stem.log"
      $currentLog=[IO.File]::ReadAllText($latexLog,[Text.Encoding]::UTF8)
      $rerunPatterns=@(
        'Label(s) may have changed. Rerun to get cross-references right.',
        'Rerun to get cross-references right',
        'There were undefined references',
        'There were undefined citations'
      )
      $needsRerun=@($rerunPatterns|Where-Object{$currentLog.Contains($_)})
      if($pass -ge 2 -and $needsRerun.Count -eq 0){
        $stable=$true
        break
      }
    }
    if(-not $stable){
      throw "$sourceName cross-references did not stabilize within five passes"
    }
    $stem=[IO.Path]::GetFileNameWithoutExtension($sourceName)
    $pdf=Join-Path $buildRoot "$stem.pdf"
    $latexLog=Join-Path $buildRoot "$stem.log"
    $logText=[IO.File]::ReadAllText($latexLog,[Text.Encoding]::UTF8)
    $fatal=@(
      @(
        '! LaTeX Error:','Fatal error occurred','There were undefined references',
        'There were undefined citations','multiply defined','multiply-defined',
        'Package hyperref Warning: Token not allowed in a PDF string',
        'Label(s) may have changed. Rerun to get cross-references right.',
        'Rerun to get cross-references right'
      ) |
      Where-Object {$logText.Contains($_)}
    )
    $boxes=@([regex]::Matches($logText,'(?m)^(Overfull|Underfull) \[hv]box')).Count
    if($fatal.Count -gt 0 -or $boxes -gt 0){
      throw "$sourceName log audit failed: fatal=$($fatal -join ';') boxes=$boxes"
    }
    $results.Add("PHASE17_LATEX=PASS source=$sourceName box_warnings=0 pdf=$pdf")
  }
}finally{
  Pop-Location
}

[IO.File]::WriteAllLines($consoleLog,$output,[Text.UTF8Encoding]::new($false))
foreach($result in $results){Write-Output $result}
Write-Output "CONSOLE_LOG=$consoleLog"
Write-Output "TEMP=$tempRoot"
