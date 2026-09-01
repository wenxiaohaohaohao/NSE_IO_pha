[CmdletBinding()]
param(
  [Parameter(Mandatory=$true)]
  [ValidateSet('IN_PROGRESS','READY_FOR_APPROVAL','APPROVED')]
  [string]$ExpectedStatus
)
$ErrorActionPreference='Stop'
$modelRebuild=Split-Path -Parent $PSScriptRoot
$paperRoot=Split-Path -Parent $modelRebuild
$repoRoot=Split-Path -Parent $paperRoot
$auditRoot=Join-Path $modelRebuild 'audit'
$specRoot=Join-Path $modelRebuild 'spec'
$sourceRoot=Join-Path $specRoot 'source'
$notesRoot=Join-Path $paperRoot 'model_notes'
$compPath=Join-Path $modelRebuild '08_comparative_statics.tex'
$fullPath=Join-Path $modelRebuild '12_full_derivation_draft.tex'
$propPath=Join-Path $modelRebuild '08_required_propositions.tex'
$mapPath=Join-Path $notesRoot '02_equation_dependency_map.md'
$statusPath=Join-Path $notesRoot '00_model_closure_status.md'
$matrixPath=Join-Path $specRoot 'instruction_traceability_matrix.csv'
$independentPath=Join-Path $auditRoot 'phase15_independent_derivation_audit.md'
$renderAuditPath=Join-Path $auditRoot 'phase15_pdf_render_audit.md'
$gatePath=Join-Path $auditRoot 'phase15_gate_report.md'
$wrapperLog=Join-Path $auditRoot 'build_phase15\phase15_compile_wrapper.log'
$wrapperPdf=Join-Path $auditRoot 'build_phase15\phase15_compile_wrapper.pdf'
$fullLog=Join-Path $auditRoot 'build_phase15_full\12_full_derivation_draft.log'
$fullPdf=Join-Path $auditRoot 'build_phase15_full\12_full_derivation_draft.pdf'
$jsonPath=Join-Path $auditRoot 'phase15_audit_results.json'
$fullCompiler=Join-Path $PSScriptRoot 'compile_phase15_full_draft.ps1'
$lockedBase='cd5b6e49608749e0bf32f3d9aa235a84f378347b'
$entryCommit='90cb8b867209f3776d14571544c8a29a70632a03'
$checks=[Collections.Generic.List[object]]::new()

function Add-Check([string]$Id,[bool]$Passed,[string]$Evidence){
  $checks.Add([pscustomobject]@{id=$Id;passed=$Passed;evidence=$Evidence})
}
function Test-Hash([string]$Id,[string]$Path,[string]$Expected){
  $actual=if(Test-Path -LiteralPath $Path -PathType Leaf){(Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash}else{'MISSING'}
  Add-Check $Id ($actual -eq $Expected) "expected=$Expected actual=$actual"
}

foreach($source in @(
 @('P15-HASH-BASE','MAH_model_rebuild_execution_note_for_Codex.md','F6C11377D71E4E25D40FFB8AC9FE2EA7AA051AD7E123BA7E3A32DBA895342B24'),
 @('P15-HASH-AMD11','MAH_model_rebuild_amendment_v1.1_for_Codex.md','D76856241E460D31087AB60690E85D5681806E53BD42991F725458727CCD1EA9'),
 @('P15-HASH-AMD12-IMAGE','MAH_model_rebuild_correction_v1.2.png','1C0035AB49A5FF5C207CB71C1E3F04CFAC4E333BEDDAB73841D2A72F603723E5'),
 @('P15-HASH-AMD12-TEXT','MAH_model_rebuild_correction_v1.2_transcription.md','06AF48B2D853EA82F7176505D2ACA4D0CBFE06E5DB52C18026308196FE85E48E')
)){Test-Hash $source[0] (Join-Path $sourceRoot $source[1]) $source[2]}
Test-Hash 'P15-HASH-EFFECTIVE' (Join-Path $specRoot 'MAH_model_rebuild_effective_spec_v1.2.md') '855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666'

$branch=(& git -C $repoRoot branch --show-current).Trim()
$head=(& git -C $repoRoot rev-parse HEAD).Trim()
$remote=(& git -C $repoRoot rev-parse origin/codex/mah-model-rebuild).Trim()
Add-Check 'P15-GIT-BRANCH' ($branch -eq 'codex/mah-model-rebuild') "branch=$branch"
Add-Check 'P15-GIT-ENTRY' ($head -eq $entryCommit) "head=$head"
Add-Check 'P15-GIT-REMOTE' ($remote -eq $head) "remote=$remote"
$manuscriptDiff=@(& git -C $repoRoot diff --name-only $lockedBase -- paper/manuscript)
$zipStatus=@(& git -C $repoRoot status --porcelain=v1 -- paper/collaboration/MAH_model_update_20260717.zip)
Add-Check 'P15-MANUSCRIPT-READ-ONLY' ($manuscriptDiff.Count -eq 0) "changed=$($manuscriptDiff -join ';')"
Add-Check 'P15-ZIP-ISOLATED' ($zipStatus.Count -eq 0) "count=$($zipStatus.Count)"

foreach($path in @(
 $compPath,$fullPath,$propPath,$mapPath,(Join-Path $auditRoot 'phase15_preflight.md'),
 $independentPath,$renderAuditPath,(Join-Path $auditRoot 'phase15_compile_wrapper.tex'),
 (Join-Path $auditRoot 'phase15_compile_console.txt'),(Join-Path $auditRoot 'phase15_full_compile_console.txt'),
 $wrapperLog,$wrapperPdf,$fullLog,$fullPdf,$fullCompiler
)){Add-Check ('P15-FILE-'+[IO.Path]::GetFileName($path)) (Test-Path -LiteralPath $path -PathType Leaf) "path=$path"}

if(Test-Path -LiteralPath $fullCompiler -PathType Leaf){& $fullCompiler}

$statusText=[IO.File]::ReadAllText($statusPath,[Text.Encoding]::UTF8)
$statusNeedle="| 15 Comparative statics/full draft | $($ExpectedStatus -replace '_',' ') |"
Add-Check 'P15-STATE-P14' $statusText.Contains('| 14 Assumption discipline | APPROVED |') 'Phase 14 approved'
Add-Check 'P15-STATE-P15' $statusText.Contains($statusNeedle) "expected=$statusNeedle"
Add-Check 'P15-STATE-P16' $statusText.Contains('| 16 Main/appendix candidates | NOT STARTED |') 'Phase 16 not started'

$matrix=Import-Csv -LiteralPath $matrixPath
$approval=if($ExpectedStatus -eq 'APPROVED'){'YES'}else{'NO'}
foreach($id in @('P15-D01','P15-G01')){
  $row=@($matrix|Where-Object requirement_id -eq $id)
  $ok=$row.Count -eq 1 -and $row[0].current_status -eq $ExpectedStatus -and $row[0].approval_status -eq $approval
  Add-Check ('P15-MATRIX-'+$id) $ok "rows=$($row.Count)"
}
foreach($id in @(
 'QA-PROOF-01','QA-PROOF-02','QA-PROOF-03','QA-PROOF-04','QA-PROOF-05',
 'QA-PROOF-06','QA-PROOF-07','QA-PROOF-08','QA-PROOF-09','QA-PROOF-10',
 'QA-ECON-01','QA-ECON-02','QA-ECON-03','QA-ECON-04',
 'QA-ECON-05','QA-ECON-06','QA-ECON-07','QA-ECON-08'
)){
  $row=@($matrix|Where-Object requirement_id -eq $id)
  $ok=$row.Count -eq 1 -and $row[0].current_status -eq $ExpectedStatus -and $row[0].approval_status -eq $approval
  Add-Check ('P15-MATRIX-'+$id) $ok "rows=$($row.Count)"
}

$comp=[IO.File]::ReadAllText($compPath,[Text.Encoding]::UTF8)
$map=[IO.File]::ReadAllText($mapPath,[Text.Encoding]::UTF8)
$full=[IO.File]::ReadAllText($fullPath,[Text.Encoding]::UTF8)
$prop=[IO.File]::ReadAllText($propPath,[Text.Encoding]::UTF8)
$labels=@([regex]::Matches($comp,'\\label\{(eq:p15-[^}]+)\}')|ForEach-Object{$_.Groups[1].Value})
Add-Check 'P15-LABEL-COUNT' ($labels.Count -eq 20) "count=$($labels.Count)"
Add-Check 'P15-LABEL-UNIQUE' ((@($labels|Sort-Object -Unique)).Count -eq 20) "unique=$((@($labels|Sort-Object -Unique)).Count)"
$mapLabels=@([regex]::Matches($map,'(?m)^\| P15-E\d{2} / (eq:p15-[^ ]+) \|')|ForEach-Object{$_.Groups[1].Value})
Add-Check 'P15-MAP-ROW-COUNT' ($mapLabels.Count -eq 20) "count=$($mapLabels.Count)"
$missing=@($labels|Where-Object{$_ -notin $mapLabels})
$extra=@($mapLabels|Where-Object{$_ -notin $labels})
Add-Check 'P15-MAP-COVERAGE' ($missing.Count -eq 0 -and $extra.Count -eq 0) "missing=$($missing -join ';') extra=$($extra -join ';')"
foreach($parent in @(
 'P15-E08 / eq:p15-fixed-advancement-gain','P08-E05--P08-E06',
 'P15-E11 / eq:p15-equilibrium-ift','P06-E10, P08-E10',
 'P15-E16 / eq:p15-retained-outcome-change','P08-E15, P08-E18, P15-E14',
 'P15-E20 / eq:p15-novelty-boundary','P08-E09'
)){Add-Check ('P15-MAP-PARENT-'+$parent.GetHashCode().ToString('X8')) $map.Contains($parent) "required=$parent"}

$expectedInputs=@(
 '01_primitives_and_timing.tex','02_demand_profit_derivation.tex','03_internal_external_technologies.tex',
 '04_route_values_and_sorting.tex','05_rd_problem.tex','06_cmo_supply_demand_equilibrium.tex',
 '07_equilibrium_definition.tex','08_required_propositions.tex','08_comparative_statics.tex',
 '09_observed_outcomes.tex','10_empirical_mapping.tex','11_extensions_not_baseline.tex'
)
$inputs=@([regex]::Matches($full,'\\input\{([^}]+)\}')|ForEach-Object{$_.Groups[1].Value})
Add-Check 'P15-FULL-INPUTS' (($inputs -join '|') -eq ($expectedInputs -join '|')) "inputs=$($inputs -join ';')"
Add-Check 'P15-FULL-NOT-CANDIDATE' ($full.Contains('not the main-text or appendix candidate') -and -not $full.Contains('13_main_text_model_candidate')) 'full draft boundary'

foreach($section in @(
 'Commercial pricing and return','Commercialization-route choice at fixed CMO price',
 'Project advancement at fixed CMO price','CMO supply, demand, and continuous equilibrium derivatives',
 'Binary reform at the equilibrium CMO price','Planning-stage and realized-product finite comparisons',
 'Mandatory limiting-case audit'
)){Add-Check ('P15-SECTION-'+$section.GetHashCode().ToString('X8')) $comp.Contains($section) "required=$section"}

foreach($required in @(
 'Object and held-fixed variables','Supplier object and held-fixed variables','Object and finite comparison',
 'Economic interpretation and empirical prediction','Interpretation and prediction',
 'Sufficient conditions and zero effects','Conditions and zero effects',
 'There is no derivative with respect to binary \(M\)','This formula is not applied to binary \(M\)',
 'fixed-candidate-price derivative','equilibrium CMO-price feedback',
 '\Delta_{IE,k}','k_i\to\infty','k_i<\underline{k}(m)','M=0',
 'p_m\to\infty','Zero entrusted-route advantage','Perfectly elastic CMO supply',
 'For \(\nu=1\)','If \(\rho_O=0\)','if \(\rho_{\mathrm{Inc}}=0\)',
 'supports of positive entrusted surplus reverses their ordering','not upstream research',
 'manufacturer records can test the assignment prediction'
)){Add-Check ('P15-TEXT-'+$required.GetHashCode().ToString('X8')) $comp.Contains($required) "required=$required"}

foreach($forbidden in @(
 '\frac{\partial M','\partial x_i^*/\partial M','\partial p_m^*/\partial M',
 'M\Rightarrow innovation','x_{ig}\geq0','p\equiv p_m',
 '\Delta\Omega_{iO}>\Delta\Omega_{i\mathrm{Inc}}\quad\text{always}'
)){Add-Check ('P15-NO-FORBIDDEN-'+$forbidden.GetHashCode().ToString('X8')) (-not $comp.Contains($forbidden)) "forbidden=$forbidden"}
Add-Check 'P15-P8-CORRECTION' ($prop.Contains('operating-cost term') -and $prop.Contains('weakly positive') -and $prop.Contains('setup-cost term is strictly positive')) 'P1 wording corrected'

$independent=[IO.File]::ReadAllText($independentPath,[Text.Encoding]::UTF8)
foreach($required in @(
 'Product pricing','Project advancement','Qualified-capacity supply',
 'Dimension audit','Mandatory boundary audit','no P0',
 'P1 wording','Phase 15 P1 remains'
)){Add-Check ('P15-INDEPENDENT-'+$required.GetHashCode().ToString('X8')) $independent.Contains($required) "required=$required"}
$render=[IO.File]::ReadAllText($renderAuditPath,[Text.Encoding]::UTF8)
Add-Check 'P15-RENDER-AUDIT' ($render.Contains('Pages: 36') -and $render.Contains('No clipped text') -and $render.Contains('| 27 |') -and $render.Contains('| 36 |')) 'seven-page render sample passed'

$allLabels=[Collections.Generic.List[string]]::new()
foreach($input in $expectedInputs){
  $path=Join-Path $modelRebuild $input
  $text=[IO.File]::ReadAllText($path,[Text.Encoding]::UTF8)
  foreach($m in [regex]::Matches($text,'\\label\{([^}]+)\}')){$allLabels.Add($m.Groups[1].Value)}
}
$duplicates=@($allLabels|Group-Object|Where-Object Count -gt 1)
Add-Check 'P15-ALL-LABELS-UNIQUE' ($duplicates.Count -eq 0) "duplicates=$(@($duplicates|ForEach-Object{$_.Name}) -join ';')"

foreach($pair in @(@($wrapperLog,'P15-WRAPPER'),@($fullLog,'P15-FULL'))){
  $log=if(Test-Path -LiteralPath $pair[0]){[IO.File]::ReadAllText($pair[0],[Text.Encoding]::UTF8)}else{''}
  $fatal=@(@('! LaTeX Error:','Fatal error occurred','There were undefined references','multiply defined')|Where-Object{$log.Contains($_)})
  $boxes=@([regex]::Matches($log,'(?m)^(Overfull|Underfull) \\[hv]box')).Count
  Add-Check ($pair[1]+'-LATEX-FATAL') ($fatal.Count -eq 0 -and $log.Length -gt 0) "fatal=$($fatal -join ';')"
  Add-Check ($pair[1]+'-LATEX-BOXES') ($boxes -eq 0) "box_warnings=$boxes"
}

$pdfinfo='C:\Users\dongw\.cache\codex-runtimes\codex-primary-runtime\dependencies\native\poppler\Library\bin\pdfinfo.exe'
$info=if(Test-Path -LiteralPath $pdfinfo){@(& $pdfinfo $fullPdf)}else{@()}
$pageLine=@($info|Where-Object{$_ -match '^Pages:'})|Select-Object -First 1
Add-Check 'P15-PDF-PAGES' ($pageLine -match 'Pages:\s+36') "line=$pageLine"

$allowed=@(
 'paper/model_notes/00_model_closure_status.md','paper/model_notes/02_equation_dependency_map.md',
 'paper/model_rebuild/.gitattributes','paper/model_rebuild/08_comparative_statics.tex',
 'paper/model_rebuild/08_required_propositions.tex','paper/model_rebuild/12_full_derivation_draft.tex',
 'paper/model_rebuild/audit/phase15_artifact_hashes.md','paper/model_rebuild/audit/phase15_audit_results.json',
 'paper/model_rebuild/audit/phase15_commit_manifest.txt','paper/model_rebuild/audit/phase15_compile_console.txt',
 'paper/model_rebuild/audit/phase15_compile_wrapper.tex','paper/model_rebuild/audit/phase15_full_compile_console.txt',
 'paper/model_rebuild/audit/phase15_gate_report.md','paper/model_rebuild/audit/phase15_independent_derivation_audit.md',
 'paper/model_rebuild/audit/phase15_pdf_render_audit.md','paper/model_rebuild/audit/phase15_preflight.md',
 'paper/model_rebuild/scripts/audit_phase15.ps1','paper/model_rebuild/scripts/compile_phase15_full_draft.ps1',
 'paper/model_rebuild/spec/approvals/phase15_standing_authorization.md',
 'paper/model_rebuild/spec/instruction_traceability_matrix.csv','paper/model_rebuild/spec/specification_hashes.md'
)
$allowedSet=[Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
foreach($path in $allowed){[void]$allowedSet.Add($path)}
$unexpected=[Collections.Generic.List[string]]::new()
foreach($line in @(& git -C $repoRoot status --porcelain=v1 --untracked-files=all)){
  if([string]::IsNullOrWhiteSpace($line)){continue}
  $path=$line.Substring(3).Replace('\','/')
  if(-not $allowedSet.Contains($path)){$unexpected.Add($path)}
}
Add-Check 'P15-SCOPE-EXACT' ($unexpected.Count -eq 0) "unexpected=$($unexpected -join ';')"

if($ExpectedStatus -in @('READY_FOR_APPROVAL','APPROVED')){
  $gate=if(Test-Path -LiteralPath $gatePath){[IO.File]::ReadAllText($gatePath,[Text.Encoding]::UTF8)}else{''}
  $ids=@(
   'RL-01','RL-28','P15-D01','P15-G01','QA-PROOF-01','QA-PROOF-10',
   'QA-ECON-01','QA-ECON-08','SUCCESS-01','SUCCESS-13'
  )
  $missingGate=@($ids|Where-Object{-not $gate.Contains($_)})
  Add-Check 'P15-GATE-IDS' ($missingGate.Count -eq 0) "missing=$($missingGate -join ';')"
  Add-Check 'P15-GATE-RESULT' ($gate.Contains('P0: 0') -and $gate.Contains('Overall gate: PASS')) 'gate PASS'
}

$failed=@($checks|Where-Object{-not $_.passed})
$result=[ordered]@{
 phase=15;expected_status=$ExpectedStatus;status=if($failed.Count -eq 0){$ExpectedStatus}else{'AUDIT_FAILED'}
 generated_at=(Get-Date).ToString('o');passed=@($checks|Where-Object passed).Count;failed=$failed.Count;checks=$checks
}
[IO.File]::WriteAllText($jsonPath,($result|ConvertTo-Json -Depth 6)+[Environment]::NewLine,[Text.UTF8Encoding]::new($false))
Write-Output "SUMMARY status=$($result.status) passed=$($result.passed) failed=$($result.failed) report=$jsonPath"
foreach($item in $failed){Write-Output "FAIL $($item.id): $($item.evidence)"}
if($failed.Count -gt 0){exit 1}
