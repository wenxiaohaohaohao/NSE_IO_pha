[CmdletBinding()]
param(
  [Parameter(Mandatory=$true)]
  [ValidateSet('IN_PROGRESS','READY_FOR_APPROVAL','APPROVED')]
  [string]$ExpectedStatus
)

Set-StrictMode -Version Latest
$ErrorActionPreference='Stop'
$modelRebuild=Split-Path -Parent $PSScriptRoot
$paperRoot=Split-Path -Parent $modelRebuild
$repoRoot=Split-Path -Parent $paperRoot
$auditRoot=Join-Path $modelRebuild 'audit'
$specRoot=Join-Path $modelRebuild 'spec'
$sourceRoot=Join-Path $specRoot 'source'
$notesRoot=Join-Path $paperRoot 'model_notes'
$statusPath=Join-Path $notesRoot '00_model_closure_status.md'
$symbolsPath=Join-Path $notesRoot '01_symbols_and_objects.md'
$mapPath=Join-Path $notesRoot '02_equation_dependency_map.md'
$assumptionsPath=Join-Path $notesRoot '03_assumptions_and_scope.md'
$consistencyPath=Join-Path $notesRoot '07_consistency_audit.md'
$evidencePath=Join-Path $notesRoot '08_shigu_empirical_boundary_check.md'
$matrixPath=Join-Path $specRoot 'instruction_traceability_matrix.csv'
$mainPath=Join-Path $modelRebuild '13_main_text_model_candidate.tex'
$appendixPath=Join-Path $modelRebuild '14_appendix_model_candidate.tex'
$fullPath=Join-Path $modelRebuild '12_full_derivation_draft.tex'
$p01Path=Join-Path $modelRebuild '01_primitives_and_timing.tex'
$p02Path=Join-Path $modelRebuild '02_demand_profit_derivation.tex'
$p08csPath=Join-Path $modelRebuild '08_comparative_statics.tex'
$p09Path=Join-Path $modelRebuild '09_observed_outcomes.tex'
$p10Path=Join-Path $modelRebuild '10_empirical_mapping.tex'
$catalogPath=Join-Path $auditRoot 'phase17_occurrence_catalog.csv'
$preflightPath=Join-Path $auditRoot 'phase17_preflight.md'
$correctionPath=Join-Path $auditRoot 'phase17_p1_corrections.md'
$renderAuditPath=Join-Path $auditRoot 'phase17_pdf_render_audit.md'
$gatePath=Join-Path $auditRoot 'phase17_gate_report.md'
$jsonPath=Join-Path $auditRoot 'phase17_audit_results.json'
$catalogBuilder=Join-Path $PSScriptRoot 'build_phase17_occurrence_catalog.ps1'
$compiler=Join-Path $PSScriptRoot 'compile_phase17_candidates.ps1'
$buildRoot=Join-Path $auditRoot 'build_phase17'
$lockedBase='cd5b6e49608749e0bf32f3d9aa235a84f378347b'
$entryCommit='8d0ef8902d88f129e3ac3be41fcca6416f869398'
$checks=[Collections.Generic.List[object]]::new()

function Add-Check([string]$Id,[bool]$Passed,[string]$Evidence){
  $checks.Add([pscustomobject]@{id=$Id;passed=$Passed;evidence=$Evidence})
}
function Read-Utf8([string]$Path){
  [IO.File]::ReadAllText($Path,[Text.Encoding]::UTF8)
}
function Test-Hash([string]$Id,[string]$Path,[string]$Expected){
  $actual=if(Test-Path -LiteralPath $Path -PathType Leaf){
    (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash
  }else{'MISSING'}
  Add-Check $Id ($actual -eq $Expected) "expected=$Expected actual=$actual"
}

foreach($source in @(
 @('P17-HASH-BASE','MAH_model_rebuild_execution_note_for_Codex.md','F6C11377D71E4E25D40FFB8AC9FE2EA7AA051AD7E123BA7E3A32DBA895342B24'),
 @('P17-HASH-AMD11','MAH_model_rebuild_amendment_v1.1_for_Codex.md','D76856241E460D31087AB60690E85D5681806E53BD42991F725458727CCD1EA9'),
 @('P17-HASH-AMD12-IMAGE','MAH_model_rebuild_correction_v1.2.png','1C0035AB49A5FF5C207CB71C1E3F04CFAC4E333BEDDAB73841D2A72F603723E5'),
 @('P17-HASH-AMD12-TEXT','MAH_model_rebuild_correction_v1.2_transcription.md','06AF48B2D853EA82F7176505D2ACA4D0CBFE06E5DB52C18026308196FE85E48E')
)){Test-Hash $source[0] (Join-Path $sourceRoot $source[1]) $source[2]}
Test-Hash 'P17-HASH-EFFECTIVE' (Join-Path $specRoot 'MAH_model_rebuild_effective_spec_v1.2.md') '855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666'
Test-Hash 'P17-HASH-MAIN-CORRECTED' $mainPath '3FCF59EB25CA82055B456CC2C49CFA25C71D44E3F031295AE33856340CA2737F'
Test-Hash 'P17-HASH-APPENDIX-CORRECTED' $appendixPath 'B1FB0C2D597A69DEA66D8E3CE6E4DCC99C90EE93239B85E045347D830D4CC2C5'
Test-Hash 'P17-HASH-P01-CORRECTED' $p01Path 'C4C2A969E9A73F8794F8E2374087A885BEA16F30BA56B5AFBED4F5031B8EA95F'
Test-Hash 'P17-HASH-P02-CORRECTED' $p02Path '989F8F276ADB70946C7C8FCB5F135707B320313C7F3D59BB3FC25344B8996D96'
Test-Hash 'P17-HASH-P08CS-CORRECTED' $p08csPath 'A6CAE721D6A461BE4CACCB9C6FDCB8662A70230661877917C406E0A60C0C23AE'
Test-Hash 'P17-HASH-P09-CORRECTED' $p09Path '36B097553E748F9D1F4725FE387912AE5DAEBA437834ECAD2B27357E4575CEDD'
Test-Hash 'P17-HASH-P10-CORRECTED' $p10Path 'ACF434D4D3E99ED9D2D0D71FB78EBF49CF3036AB4D6DBA4DC32B5A75F4903F8A'

$branch=(& git -C $repoRoot branch --show-current).Trim()
$head=(& git -C $repoRoot rev-parse HEAD).Trim()
$remote=(& git -C $repoRoot rev-parse origin/codex/mah-model-rebuild).Trim()
Add-Check 'P17-GIT-BRANCH' ($branch -eq 'codex/mah-model-rebuild') "branch=$branch"
Add-Check 'P17-GIT-ENTRY' ($head -eq $entryCommit) "head=$head"
Add-Check 'P17-GIT-REMOTE' ($remote -eq $head) "remote=$remote"
$manuscriptDiff=@(& git -C $repoRoot diff --name-only $lockedBase -- paper/manuscript)
$zipStatus=@(& git -C $repoRoot status --porcelain=v1 -- paper/collaboration/MAH_model_update_20260717.zip)
Add-Check 'P17-MANUSCRIPT-READ-ONLY' ($manuscriptDiff.Count -eq 0) "changed=$($manuscriptDiff -join ';')"
Add-Check 'P17-ZIP-ISOLATED' ($zipStatus.Count -eq 0) "count=$($zipStatus.Count)"

foreach($path in @(
 $statusPath,$symbolsPath,$mapPath,$consistencyPath,$evidencePath,
 $mainPath,$appendixPath,$fullPath,$preflightPath,$correctionPath,$renderAuditPath,
 $catalogBuilder,$compiler
)){
  Add-Check ('P17-FILE-'+[IO.Path]::GetFileName($path)) (Test-Path -LiteralPath $path -PathType Leaf) "path=$path"
}

& $catalogBuilder
& $compiler
foreach($path in @(
 $catalogPath,(Join-Path $auditRoot 'phase17_compile_console.txt'),
 (Join-Path $buildRoot '13_main_text_model_candidate.pdf'),
 (Join-Path $buildRoot '13_main_text_model_candidate.log'),
 (Join-Path $buildRoot '14_appendix_model_candidate.pdf'),
 (Join-Path $buildRoot '14_appendix_model_candidate.log'),
 (Join-Path $buildRoot '12_full_derivation_draft.pdf'),
 (Join-Path $buildRoot '12_full_derivation_draft.log')
)){
  Add-Check ('P17-BUILD-'+[IO.Path]::GetFileName($path)) (Test-Path -LiteralPath $path -PathType Leaf) "path=$path"
}

$statusText=Read-Utf8 $statusPath
$statusNeedle="| 17 Consistency audit | $($ExpectedStatus -replace '_',' ') |"
Add-Check 'P17-STATE-P16' $statusText.Contains('| 16 Main/appendix candidates | APPROVED |') 'Phase 16 approved'
Add-Check 'P17-STATE-P17' $statusText.Contains($statusNeedle) "expected=$statusNeedle"
Add-Check 'P17-STATE-P18' $statusText.Contains('| 18 Manuscript integration | BLOCKED |') 'Phase 18 blocked'

$matrix=Import-Csv -LiteralPath $matrixPath
$approval=if($ExpectedStatus -eq 'APPROVED'){'YES'}else{'NO'}
foreach($id in @('P17-D01','P17-G01')){
  $row=@($matrix|Where-Object requirement_id -eq $id)
  $ok=$row.Count -eq 1 -and $row[0].current_status -eq $ExpectedStatus -and $row[0].approval_status -eq $approval
  Add-Check ('P17-MATRIX-'+$id) $ok "rows=$($row.Count) status=$($row[0].current_status) approval=$($row[0].approval_status)"
}

$catalog=Import-Csv -LiteralPath $catalogPath
Add-Check 'P17-CATALOG-TOTAL' ($catalog.Count -eq 1489) "rows=$($catalog.Count)"
$expectedCounts=@(
 @('M',135),@('tau_E',31),@('p_m',295),@('a_i',173),@('k_i',79),
 @('q',230),@('m',232),@('s(q)',34),@('W_I',13),@('W_E',30),
 @('W_T',10),@('Omega_i',88),@('x_i',139)
)
foreach($pair in $expectedCounts){
  $count=@($catalog|Where-Object {$_.object -ceq $pair[0]}).Count
  Add-Check ('P17-CATALOG-'+$pair[0]) ($count -eq [int]$pair[1]) "expected=$($pair[1]) actual=$count"
}
$emptyRows=@($catalog|Where-Object{
  [string]::IsNullOrWhiteSpace($_.surface) -or
  [string]::IsNullOrWhiteSpace($_.scope) -or
  [string]::IsNullOrWhiteSpace($_.file) -or
  [string]::IsNullOrWhiteSpace($_.category) -or
  [string]::IsNullOrWhiteSpace($_.canonical_meaning) -or
  [string]::IsNullOrWhiteSpace($_.direct_M_shift)
})
Add-Check 'P17-CATALOG-CLASSIFIED' ($emptyRows.Count -eq 0) "empty_rows=$($emptyRows.Count)"
$catalogFiles=@($catalog.file|Sort-Object -Unique)
foreach($required in @(
 '13_main_text_model_candidate.tex','14_appendix_model_candidate.tex',
 '01_primitives_and_timing.tex','02_demand_profit_derivation.tex',
 '03_internal_external_technologies.tex','04_route_values_and_sorting.tex',
 '05_rd_problem.tex','06_cmo_supply_demand_equilibrium.tex',
 '07_equilibrium_definition.tex','08_required_propositions.tex',
 '08_comparative_statics.tex','09_observed_outcomes.tex',
 '10_empirical_mapping.tex','11_extensions_not_baseline.tex'
)){
  Add-Check ('P17-CATALOG-SOURCE-'+$required) ($catalogFiles -contains $required) "required=$required"
}
$builderText=Read-Utf8 $catalogBuilder
Add-Check 'P17-CATALOG-FULL-DRAFT-CONTAINER' $builderText.Contains("file='12_full_derivation_draft.tex'") 'full draft container explicitly scanned; zero standalone matches'

$symbols=Read-Utf8 $symbolsPath
$expectedLedgerStatus=if($ExpectedStatus -eq 'APPROVED'){
  'PHASES 1--17 - APPROVED'
}else{
  'PHASES 1--16 - APPROVED; PHASE 17 - IN PROGRESS'
}
$expectedRegistry=if($ExpectedStatus -eq 'APPROVED'){
  'Active object registry through Phase 17'
}else{
  'Active object registry through Phase 16'
}
foreach($required in @(
 $expectedLedgerStatus,
 $expectedRegistry,'institutional regime',
 'research capability','internal manufacturing capability',
 'project commercial/scientific value shifter','manufacturing requirement/complexity',
 'downstream realization probability','retained entrusted-route project value',
 'expected optimized value per route-planning-stage project',
 'original-drug innovation investment / project-advancement intensity'
)){
  Add-Check ('P17-SYMBOL-'+$required.GetHashCode().ToString('X8')) $symbols.Contains($required) "required=$required"
}

$p01=Read-Utf8 $p01Path
Add-Check 'P17-ONE-ROUTE-DOMAIN' ($p01.Contains('r_i\in\{I,E,T,A\}') -and -not $p01.Contains('\{I,T,A\}, & M=0')) 'common label domain'
Add-Check 'P17-ONE-POLICY-CHANNEL' ($p01.Contains('M\longrightarrow \tau_E(M)') -and $p01.Contains('infinite/finite value encodes route') -and $p01.Contains('not a second policy channel')) 'availability encoded by wedge'
$map=Read-Utf8 $mapPath
Add-Check 'P17-MAP-ROUTE-DOMAIN' ($map.Contains('common route-label domain $\{I,E,T,A\}$') -and $map.Contains('effective pre-MAH exclusion of $E$ is encoded by P01-E04')) 'dependency map aligned'
Add-Check 'P17-MAP-ONE-POLICY-CHANNEL' ($map.Contains('M -> tau_E(M), whose infinite/finite value encodes') -and -not $map.Contains('tau_E(M) / legal availability')) 'dependency map uses one wedge that encodes availability'

$baselineFiles=@(
 '01_primitives_and_timing.tex','02_demand_profit_derivation.tex',
 '03_internal_external_technologies.tex','04_route_values_and_sorting.tex',
 '05_rd_problem.tex','06_cmo_supply_demand_equilibrium.tex',
 '07_equilibrium_definition.tex','08_required_propositions.tex',
 '08_comparative_statics.tex','09_observed_outcomes.tex',
 '10_empirical_mapping.tex','13_main_text_model_candidate.tex',
 '14_appendix_model_candidate.tex'
)
$baseline=[Collections.Generic.List[string]]::new()
foreach($file in $baselineFiles){$baseline.Add((Read-Utf8 (Join-Path $modelRebuild $file)))}
$baselineText=$baseline -join [Environment]::NewLine
foreach($pattern in @(
 'P_\{ir\}\^\{\\mathrm\{logit\}\}','\\Gamma','x_i\^R','x_i\^D',
 '\\frac\{\\partial[^\r\n]*\}\{\\partial M\}',
 'M\s*\\longrightarrow\s*(a_i|k_i|q|m|s\(q\)|p_m|c_I|c_E|F_I|F_E)'
)){
  $count=[regex]::Matches($baselineText,$pattern).Count
  Add-Check ('P17-NO-ACTIVE-'+$pattern.GetHashCode().ToString('X8')) ($count -eq 0) "pattern=$pattern count=$count"
}
Add-Check 'P17-ETA-NEGATIVE-CROSSWALK' (
  ([regex]::Matches($baselineText,'\\eta')).Count -eq 1 -and
  (Read-Utf8 (Join-Path $modelRebuild '03_internal_external_technologies.tex')).Contains('Remove from the baseline; it has no Phase~3 replacement')
) 'single eta occurrence is deletion crosswalk'

$main=Read-Utf8 $mainPath
$appendix=Read-Utf8 $appendixPath
$p08cs=Read-Utf8 $p08csPath
$p09=Read-Utf8 $p09Path
$evidence=Read-Utf8 $evidencePath
$p02=Read-Utf8 $p02Path
$p10=Read-Utf8 $p10Path
$assumptions=Read-Utf8 $assumptionsPath
foreach($required in @(
 'At a fixed \(p_m\)','D_m(p_m^*;M)=S_m(p_m^*)',
 'Fixed-price comparisons and equilibrium-price','only through \(\Omega_i\)',
 'Holder--producer separation is observed only after route assignment',
 'no original-versus-incremental ranking',
 'applications are not a baseline endogenous outcome'
)){
  Add-Check ('P17-MAIN-'+$required.GetHashCode().ToString('X8')) $main.Contains($required) "required=$required"
}
$activePhiText=$p02+$p08cs+$main+$symbols+$assumptions
$openPhiCount=[regex]::Matches($activePhiText,'\\varphi\\in\[0,1\)').Count
$closedPhiCount=[regex]::Matches($activePhiText,'\\varphi\\in\[0,1\]').Count
Add-Check 'P17-PHI-DOMAIN' ($openPhiCount -ge 5 -and $closedPhiCount -eq 0) "open_upper_bound=$openPhiCount closed_upper_bound=$closedPhiCount"
Add-Check 'P17-PHI-LIMIT' ($p02.Contains('As \(\varphi\uparrow1\)') -and $p02.Contains('not an admissible value') -and -not $p02.Contains('If \(\varphi=1\)')) 'endpoint treated as limit under frozen domain'
Add-Check 'P17-PATENT-MEASUREMENT' ($p09.Contains('not direct observations of upstream research') -and -not $p09.Contains('Patent applications proxy upstream research')) 'patent boundary corrected'
Add-Check 'P17-PATENT-INTERFACE-BOUNDARY' ($p10.Contains('candidate patenting-side signal') -and $p10.Contains('not a direct observation of upstream research') -and $p10.Contains('does not alone validate or') -and -not $p10.Contains('candidate upstream-research proxy')) 'Phase 10 uses the same patent/upstream-research construct boundary'
Add-Check 'P17-APPENDIX-EVIDENCE-WORDING' ($appendix.Contains('clinical-trial and patenting') -and $appendix.Contains('not direct observations of upstream') -and -not $appendix.Contains('downstream development and upstream research are distinct')) 'evidence wording narrowed'
Add-Check 'P17-APPENDIX-NO-BINDING-INFERENCE' ($appendix.Contains('evidence neither') -and $appendix.Contains('identifies nor requires a binding constraint') -and -not $appendix.Contains('Entry, a binding financial constraint')) 'entry and financing boundaries separated'
Add-Check 'P17-APPENDIX-ONE-POLICY-CHANNEL' ($appendix.Contains('institutional wedge \(\tau_E(M)\), whose infinite/finite value encodes') -and -not $appendix.Contains('legal availability and finite institutional wedge')) 'appendix uses one wedge that encodes effective availability'
Add-Check 'P17-EVIDENCE-NO-FINANCE-REQUIREMENT' ($evidence.Contains('does not identify or require a binding financial constraint') -and -not $evidence.Contains('Explaining it requires')) 'finance inference bounded'
Add-Check 'P17-EVIDENCE-TRIAL-WORDING' ($evidence.Contains('clinical-trial registrations while patent applications') -and -not $evidence.Contains('clinical development while patent applications')) 'trial wording precise'

$extension=Read-Utf8 (Join-Path $modelRebuild '11_extensions_not_baseline.tex')
Add-Check 'P17-EXTENSION-ACTIVE-ONLY' ($extension.Contains('P_{ir}^{\mathrm{logit}}') -and $extension.Contains('x_i^R') -and $extension.Contains('x_i^D') -and $extension.Contains('remain inactive and cannot be cited as baseline')) 'quarantined mechanisms'
$extensionPosition=$appendix.IndexOf('\input{11_extensions_not_baseline.tex}')
$boundaryPosition=$appendix.IndexOf('\section{Research versus Development: Boundary of the Baseline}')
Add-Check 'P17-EXTENSION-LAST' ($extensionPosition -gt $boundaryPosition -and $extensionPosition -ge 0) "boundary=$boundaryPosition extension=$extensionPosition"

$corrections=Read-Utf8 $correctionPath
foreach($id in (1..12|ForEach-Object{'P17-C'+$_.ToString('00')})){
  Add-Check ('P17-CORRECTION-'+$id) $corrections.Contains($id) "required=$id"
}
Add-Check 'P17-CORRECTIONS-CLOSED' ($corrections.Contains('open P0: 0') -and $corrections.Contains('open P1: 0')) 'all P1 corrected'

$consistency=Read-Utf8 $consistencyPath
foreach($required in @(
 'Exhaustive core-object ledger','Policy-channel audit',
 'Fixed-price and equilibrium-price audit','Timing and observed-outcome audit',
 'Retained route versus transfer audit','Baseline and extension quarantine',
 'Innovation and empirical-language audit','Answers to the sixteen mandatory questions',
 'Compilation, labels, and protected scope','Candidate P0: 0',
 'Candidate P1 remaining: 0','Phase 17 consistency result:',
 '1,489 rows','P1 corrected during Phase 17: 12'
)){
  Add-Check ('P17-CONSISTENCY-'+$required.GetHashCode().ToString('X8')) $consistency.Contains($required) "required=$required"
}
foreach($number in 1..16){
  Add-Check ('P17-QUESTION-'+$number.ToString('00')) $consistency.Contains("| $number |") "question=$number"
}

$mainLabels=@([regex]::Matches($main,'\\label\{([^}]+)\}')|ForEach-Object{$_.Groups[1].Value})
$mainDuplicates=@($mainLabels|Group-Object|Where-Object Count -gt 1)
Add-Check 'P17-MAIN-LABELS-UNIQUE' ($mainDuplicates.Count -eq 0) "duplicates=$(@($mainDuplicates|ForEach-Object{$_.Name}) -join ';')"
$appendixInputs=@(
 '01_primitives_and_timing.tex','02_demand_profit_derivation.tex',
 '03_internal_external_technologies.tex','04_route_values_and_sorting.tex',
 '05_rd_problem.tex','06_cmo_supply_demand_equilibrium.tex',
 '07_equilibrium_definition.tex','08_required_propositions.tex',
 '08_comparative_statics.tex','09_observed_outcomes.tex',
 '11_extensions_not_baseline.tex'
)
$expandedLabels=[Collections.Generic.List[string]]::new()
foreach($input in $appendixInputs){
  foreach($match in [regex]::Matches((Read-Utf8 (Join-Path $modelRebuild $input)),'\\label\{([^}]+)\}')){
    $expandedLabels.Add($match.Groups[1].Value)
  }
}
foreach($match in [regex]::Matches($appendix,'\\label\{([^}]+)\}')){$expandedLabels.Add($match.Groups[1].Value)}
$appendixDuplicates=@($expandedLabels|Group-Object|Where-Object Count -gt 1)
Add-Check 'P17-APPENDIX-LABELS-UNIQUE' ($appendixDuplicates.Count -eq 0) "duplicates=$(@($appendixDuplicates|ForEach-Object{$_.Name}) -join ';')"

foreach($stem in @('13_main_text_model_candidate','14_appendix_model_candidate','12_full_derivation_draft')){
  $logPath=Join-Path $buildRoot "$stem.log"
  $log=if(Test-Path -LiteralPath $logPath){Read-Utf8 $logPath}else{''}
  $fatalPatterns=@(
    '! LaTeX Error:','Fatal error occurred','There were undefined references',
    'There were undefined citations','multiply defined','multiply-defined',
    'Package hyperref Warning: Token not allowed in a PDF string',
    'Label(s) may have changed. Rerun to get cross-references right.',
    'Rerun to get cross-references right'
  )
  $fatal=@($fatalPatterns|Where-Object{$log.Contains($_)})
  $boxes=@([regex]::Matches($log,'(?m)^(Overfull|Underfull) \[hv]box')).Count
  Add-Check ('P17-LATEX-'+$stem) ($log.Length -gt 0 -and $fatal.Count -eq 0 -and $boxes -eq 0) "fatal=$($fatal -join ';') boxes=$boxes"
}

$pdfinfo='C:\Users\dongw\.cache\codex-runtimes\codex-primary-runtime\dependencies\native\poppler\Library\bin\pdfinfo.exe'
foreach($pair in @(
 @('13_main_text_model_candidate',4),
 @('14_appendix_model_candidate',33),
 @('12_full_derivation_draft',36)
)){
  $pdf=Join-Path $buildRoot "$($pair[0]).pdf"
  $info=if(Test-Path -LiteralPath $pdfinfo){@(& $pdfinfo $pdf)}else{@()}
  $pageLine=@($info|Where-Object{$_ -match '^Pages:'})|Select-Object -First 1
  Add-Check ('P17-PDF-'+$pair[0]) ($pageLine -match "Pages:\s+$($pair[1])$") "line=$pageLine"
}

$renderAudit=Read-Utf8 $renderAuditPath
Add-Check 'P17-PDF-RENDER-AUDIT' ($renderAudit.Contains('Visual defects found: 0') -and $renderAudit.Contains('| 4 |') -and $renderAudit.Contains('| 7 |') -and $renderAudit.Contains('| 24 |') -and $renderAudit.Contains('| 31 |')) 'four correction-bearing appendix pages visually audited'

$allowed=@(
 'paper/model_notes/00_model_closure_status.md','paper/model_notes/01_symbols_and_objects.md',
 'paper/model_notes/02_equation_dependency_map.md','paper/model_notes/07_consistency_audit.md',
 'paper/model_notes/08_shigu_empirical_boundary_check.md',
 'paper/model_rebuild/01_primitives_and_timing.tex',
 'paper/model_rebuild/02_demand_profit_derivation.tex',
 'paper/model_rebuild/08_comparative_statics.tex',
 'paper/model_rebuild/09_observed_outcomes.tex',
 'paper/model_rebuild/10_empirical_mapping.tex',
 'paper/model_rebuild/13_main_text_model_candidate.tex',
 'paper/model_rebuild/14_appendix_model_candidate.tex',
 'paper/model_rebuild/audit/phase17_artifact_hashes.md',
 'paper/model_rebuild/audit/phase17_audit_results.json',
 'paper/model_rebuild/audit/phase17_commit_manifest.txt',
 'paper/model_rebuild/audit/phase17_compile_console.txt',
 'paper/model_rebuild/audit/phase17_gate_report.md',
 'paper/model_rebuild/audit/phase17_occurrence_catalog.csv',
 'paper/model_rebuild/audit/phase17_p1_corrections.md',
 'paper/model_rebuild/audit/phase17_pdf_render_audit.md',
 'paper/model_rebuild/audit/phase17_preflight.md',
 'paper/model_rebuild/scripts/audit_phase17.ps1',
 'paper/model_rebuild/scripts/build_phase17_occurrence_catalog.ps1',
 'paper/model_rebuild/scripts/compile_phase17_candidates.ps1',
 'paper/model_rebuild/spec/approvals/phase17_standing_authorization.md',
 'paper/model_rebuild/spec/instruction_traceability_matrix.csv',
 'paper/model_rebuild/spec/specification_hashes.md'
)
$allowedSet=[Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
foreach($path in $allowed){[void]$allowedSet.Add($path)}
$unexpected=[Collections.Generic.List[string]]::new()
foreach($line in @(& git -C $repoRoot status --porcelain=v1 --untracked-files=all)){
  if([string]::IsNullOrWhiteSpace($line)){continue}
  $path=$line.Substring(3).Replace('\','/')
  if(-not $allowedSet.Contains($path)){$unexpected.Add($path)}
}
Add-Check 'P17-SCOPE-EXACT' ($unexpected.Count -eq 0) "unexpected=$($unexpected -join ';')"

if($ExpectedStatus -in @('READY_FOR_APPROVAL','APPROVED')){
  $gate=if(Test-Path -LiteralPath $gatePath){Read-Utf8 $gatePath}else{''}
  $ids=@(
    'RL-01','RL-28','P17-D01','P17-G01','QA-PROOF-01','QA-PROOF-10',
    'QA-ECON-01','QA-ECON-08','SUCCESS-01','SUCCESS-13',
    'P17-C01','P17-C12'
  )
  $missingGate=@($ids|Where-Object{-not $gate.Contains($_)})
  Add-Check 'P17-GATE-IDS' ($missingGate.Count -eq 0) "missing=$($missingGate -join ';')"
  Add-Check 'P17-GATE-RESULT' ($gate.Contains('P0: 0') -and $gate.Contains('P1 remaining: 0') -and $gate.Contains('Overall gate: PASS')) 'gate PASS'
}

$failed=@($checks|Where-Object{-not $_.passed})
$result=[ordered]@{
  phase=17
  expected_status=$ExpectedStatus
  status=if($failed.Count -eq 0){$ExpectedStatus}else{'AUDIT_FAILED'}
  generated_at=(Get-Date).ToString('o')
  passed=@($checks|Where-Object passed).Count
  failed=$failed.Count
  checks=$checks
}
[IO.File]::WriteAllText($jsonPath,($result|ConvertTo-Json -Depth 6)+[Environment]::NewLine,[Text.UTF8Encoding]::new($false))
Write-Output "SUMMARY status=$($result.status) passed=$($result.passed) failed=$($result.failed) report=$jsonPath"
foreach($item in $failed){Write-Output "FAIL $($item.id): $($item.evidence)"}
if($failed.Count -gt 0){exit 1}
