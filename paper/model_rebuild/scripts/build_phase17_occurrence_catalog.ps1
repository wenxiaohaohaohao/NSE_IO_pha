[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference='Stop'
$modelRebuild=Split-Path -Parent $PSScriptRoot
$auditRoot=Join-Path $modelRebuild 'audit'
$outputPath=Join-Path $auditRoot 'phase17_occurrence_catalog.csv'

$sources=@(
  [pscustomobject]@{surface='main';scope='baseline';file='13_main_text_model_candidate.tex'},
  [pscustomobject]@{surface='appendix-container';scope='boundary';file='14_appendix_model_candidate.tex'},
  [pscustomobject]@{surface='appendix-module';scope='baseline';file='01_primitives_and_timing.tex'},
  [pscustomobject]@{surface='appendix-module';scope='baseline';file='02_demand_profit_derivation.tex'},
  [pscustomobject]@{surface='appendix-module';scope='baseline';file='03_internal_external_technologies.tex'},
  [pscustomobject]@{surface='appendix-module';scope='baseline';file='04_route_values_and_sorting.tex'},
  [pscustomobject]@{surface='appendix-module';scope='baseline';file='05_rd_problem.tex'},
  [pscustomobject]@{surface='appendix-module';scope='baseline';file='06_cmo_supply_demand_equilibrium.tex'},
  [pscustomobject]@{surface='appendix-module';scope='baseline';file='07_equilibrium_definition.tex'},
  [pscustomobject]@{surface='appendix-module';scope='baseline';file='08_required_propositions.tex'},
  [pscustomobject]@{surface='appendix-module';scope='baseline';file='08_comparative_statics.tex'},
  [pscustomobject]@{surface='appendix-module';scope='baseline';file='09_observed_outcomes.tex'},
  [pscustomobject]@{surface='empirical-interface';scope='interface';file='10_empirical_mapping.tex'},
  [pscustomobject]@{surface='full-draft-container';scope='assembly';file='12_full_derivation_draft.tex'},
  [pscustomobject]@{surface='appendix-module';scope='extension';file='11_extensions_not_baseline.tex'}
)

$objects=@(
  [pscustomobject]@{object='M';pattern='(?<![A-Za-z0-9_\\])M(?![A-Za-z0-9_])';category='primitive parameter';meaning='binary institutional regime';direct='policy object'},
  [pscustomobject]@{object='tau_E';pattern='\\tau_E(?:\(M\))?';category='primitive parameter';meaning='institutional barrier on retained entrusted route E';direct='yes, through M only'},
  [pscustomobject]@{object='p_m';pattern='p_m(?:\^\*|\^\{\*\})?';category='equilibrium price / candidate price';meaning='qualified manufacturing-service capacity price';direct='no'},
  [pscustomobject]@{object='a_i';pattern='a_i';category='exogenous firm characteristic';meaning='research capability for viable planning-stage projects';direct='no'},
  [pscustomobject]@{object='k_i';pattern='k_i';category='exogenous firm characteristic';meaning='internal manufacturing capability';direct='no'},
  [pscustomobject]@{object='q';pattern='(?<![A-Za-z0-9_\\])q(?![A-Za-z0-9_])';category='exogenous project characteristic';meaning='commercial/scientific value shifter';direct='no'},
  [pscustomobject]@{object='m';pattern='(?<![A-Za-z0-9_\\])m(?![A-Za-z0-9_])';category='exogenous project characteristic';meaning='manufacturing requirement/complexity';direct='no'},
  [pscustomobject]@{object='s(q)';pattern='s(?:_g)?\(q\)';category='primitive parameter/function';meaning='exogenous downstream realization probability';direct='no'},
  [pscustomobject]@{object='W_I';pattern='W_i\^I';category='endogenous route-level object';meaning='internal-manufacturing route value';direct='indirect only'},
  [pscustomobject]@{object='W_E';pattern='W_i\^E';category='endogenous route-level object';meaning='retained entrusted-manufacturing route value';direct='through tau_E only'},
  [pscustomobject]@{object='W_T';pattern='W(?:_i)?\^T';category='endogenous route-level object';meaning='non-retained transfer-route value';direct='no'},
  [pscustomobject]@{object='Omega_i';pattern='\\Omega_i';category='endogenous firm-level object';meaning='expected optimized value per planning-stage project';direct='indirect only'},
  [pscustomobject]@{object='x_i';pattern='x_i(?:\^\*|\^\{\*\})?';category='control / optimized control';meaning='original-drug innovation investment / project-advancement intensity';direct='through Omega_i only'}
)

$rows=[Collections.Generic.List[object]]::new()
foreach($source in $sources){
  $path=Join-Path $modelRebuild $source.file
  if(-not (Test-Path -LiteralPath $path -PathType Leaf)){
    throw "Missing catalog source: $path"
  }
  $text=[IO.File]::ReadAllText($path,[Text.Encoding]::UTF8)
  $lines=[regex]::Split($text,'\r?\n')
  for($lineIndex=0;$lineIndex -lt $lines.Count;$lineIndex++){
    $line=$lines[$lineIndex]
    foreach($definition in $objects){
      $matches=[regex]::Matches($line,$definition.pattern)
      for($matchIndex=0;$matchIndex -lt $matches.Count;$matchIndex++){
        $match=$matches[$matchIndex]
        $variant=$match.Value
        if($definition.object -eq 'p_m'){
          $variant=if($match.Value.Contains('^')){'equilibrium-starred'}else{'candidate-or-generic'}
        }elseif($definition.object -eq 'x_i'){
          $variant=if($match.Value.Contains('^')){'optimized'}else{'control'}
        }
        $rows.Add([pscustomobject]@{
          surface=$source.surface
          scope=$source.scope
          file=$source.file
          line=$lineIndex+1
          object=$definition.object
          occurrence_in_line=$matchIndex+1
          matched_text=$match.Value
          variant=$variant
          category=$definition.category
          canonical_meaning=$definition.meaning
          direct_M_shift=$definition.direct
          context=($line.Trim() -replace '\s+',' ')
        })
      }
    }
  }
}

$rows |
  Sort-Object surface,scope,file,line,object,occurrence_in_line |
  Export-Csv -LiteralPath $outputPath -NoTypeInformation -Encoding utf8

Write-Output "PHASE17_OCCURRENCE_CATALOG=PASS rows=$($rows.Count) path=$outputPath"
foreach($definition in $objects){
  $count=@($rows|Where-Object {$_.object -ceq $definition.object}).Count
  Write-Output "OBJECT=$($definition.object) occurrences=$count"
}
