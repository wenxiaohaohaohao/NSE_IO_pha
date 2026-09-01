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
$evidenceRoot=Join-Path $modelRebuild 'evidence'
$mainPath=Join-Path $modelRebuild '13_main_text_model_candidate.tex'
$appendixPath=Join-Path $modelRebuild '14_appendix_model_candidate.tex'
$evidenceNote=Join-Path $notesRoot '08_shigu_empirical_boundary_check.md'
$evidenceManifest=Join-Path $evidenceRoot 'shigu_2024_ssrn_4770849_manifest.md'
$evidencePdf=Join-Path $evidenceRoot 'shigu_2024_ssrn_4770849.pdf'
$evidenceText=Join-Path $evidenceRoot 'shigu_2024_ssrn_4770849_extracted.txt'
$statusPath=Join-Path $notesRoot '00_model_closure_status.md'
$issuesPath=Join-Path $notesRoot '06_open_issues_log.md'
$matrixPath=Join-Path $specRoot 'instruction_traceability_matrix.csv'
$preflightPath=Join-Path $auditRoot 'phase16_preflight.md'
$splitPath=Join-Path $auditRoot 'phase16_split_ledger.md'
$independentPath=Join-Path $auditRoot 'phase16_independent_split_audit.md'
$renderPath=Join-Path $auditRoot 'phase16_pdf_render_audit.md'
$gatePath=Join-Path $auditRoot 'phase16_gate_report.md'
$compiler=Join-Path $PSScriptRoot 'compile_phase16_candidates.ps1'
$buildRoot=Join-Path $auditRoot 'build_phase16'
$mainLog=Join-Path $buildRoot '13_main_text_model_candidate.log'
$mainPdf=Join-Path $buildRoot '13_main_text_model_candidate.pdf'
$appendixLog=Join-Path $buildRoot '14_appendix_model_candidate.log'
$appendixPdf=Join-Path $buildRoot '14_appendix_model_candidate.pdf'
$jsonPath=Join-Path $auditRoot 'phase16_audit_results.json'
$lockedBase='cd5b6e49608749e0bf32f3d9aa235a84f378347b'
$entryCommit='a181ff874a53371d2dfc775e0df2cb60b409641c'
$paperHash='A13D5D1D3DE3A0E4E0D15D5DBF428F2F395C9B95E960C7B3C97652CBC8D9EAEB'
$checks=[Collections.Generic.List[object]]::new()

function Add-Check([string]$Id,[bool]$Passed,[string]$Evidence){
  $checks.Add([pscustomobject]@{id=$Id;passed=$Passed;evidence=$Evidence})
}
function Test-Hash([string]$Id,[string]$Path,[string]$Expected){
  $actual=if(Test-Path -LiteralPath $Path -PathType Leaf){
    (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash
  }else{'MISSING'}
  Add-Check $Id ($actual -eq $Expected) "expected=$Expected actual=$actual"
}
function Read-Utf8([string]$Path){
  [IO.File]::ReadAllText($Path,[Text.Encoding]::UTF8)
}

foreach($source in @(
 @('P16-HASH-BASE','MAH_model_rebuild_execution_note_for_Codex.md','F6C11377D71E4E25D40FFB8AC9FE2EA7AA051AD7E123BA7E3A32DBA895342B24'),
 @('P16-HASH-AMD11','MAH_model_rebuild_amendment_v1.1_for_Codex.md','D76856241E460D31087AB60690E85D5681806E53BD42991F725458727CCD1EA9'),
 @('P16-HASH-AMD12-IMAGE','MAH_model_rebuild_correction_v1.2.png','1C0035AB49A5FF5C207CB71C1E3F04CFAC4E333BEDDAB73841D2A72F603723E5'),
 @('P16-HASH-AMD12-TEXT','MAH_model_rebuild_correction_v1.2_transcription.md','06AF48B2D853EA82F7176505D2ACA4D0CBFE06E5DB52C18026308196FE85E48E')
)){Test-Hash $source[0] (Join-Path $sourceRoot $source[1]) $source[2]}
Test-Hash 'P16-HASH-EFFECTIVE' (Join-Path $specRoot 'MAH_model_rebuild_effective_spec_v1.2.md') '855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666'
Test-Hash 'P16-HASH-SHIGU-PDF' $evidencePdf $paperHash

$branch=(& git -C $repoRoot branch --show-current).Trim()
$head=(& git -C $repoRoot rev-parse HEAD).Trim()
$remote=(& git -C $repoRoot rev-parse origin/codex/mah-model-rebuild).Trim()
Add-Check 'P16-GIT-BRANCH' ($branch -eq 'codex/mah-model-rebuild') "branch=$branch"
Add-Check 'P16-GIT-ENTRY' ($head -eq $entryCommit) "head=$head"
Add-Check 'P16-GIT-REMOTE' ($remote -eq $head) "remote=$remote"
$manuscriptDiff=@(& git -C $repoRoot diff --name-only $lockedBase -- paper/manuscript)
$zipStatus=@(& git -C $repoRoot status --porcelain=v1 -- paper/collaboration/MAH_model_update_20260717.zip)
Add-Check 'P16-MANUSCRIPT-READ-ONLY' ($manuscriptDiff.Count -eq 0) "changed=$($manuscriptDiff -join ';')"
Add-Check 'P16-ZIP-ISOLATED' ($zipStatus.Count -eq 0) "count=$($zipStatus.Count)"

foreach($path in @(
 $mainPath,$appendixPath,$evidenceNote,$evidenceManifest,$evidencePdf,$evidenceText,
 $preflightPath,$splitPath,$independentPath,$renderPath,$compiler,
 (Join-Path $auditRoot 'phase16_compile_console.txt')
)){
  Add-Check ('P16-FILE-'+[IO.Path]::GetFileName($path)) (Test-Path -LiteralPath $path -PathType Leaf) "path=$path"
}

if(Test-Path -LiteralPath $compiler -PathType Leaf){& $compiler}
foreach($path in @($mainLog,$mainPdf,$appendixLog,$appendixPdf)){
  Add-Check ('P16-BUILD-'+[IO.Path]::GetFileName($path)) (Test-Path -LiteralPath $path -PathType Leaf) "path=$path"
}

$statusText=Read-Utf8 $statusPath
$statusNeedle="| 16 Main/appendix candidates | $($ExpectedStatus -replace '_',' ') |"
Add-Check 'P16-STATE-P15' $statusText.Contains('| 15 Comparative statics/full draft | APPROVED |') 'Phase 15 approved'
Add-Check 'P16-STATE-P16' $statusText.Contains($statusNeedle) "expected=$statusNeedle"
Add-Check 'P16-STATE-P17' $statusText.Contains('| 17 Consistency audit | NOT STARTED |') 'Phase 17 not started'

$matrix=Import-Csv -LiteralPath $matrixPath
$approval=if($ExpectedStatus -eq 'APPROVED'){'YES'}else{'NO'}
foreach($id in @('P16-D01','P16-G01')){
  $row=@($matrix|Where-Object requirement_id -eq $id)
  $ok=$row.Count -eq 1 -and $row[0].current_status -eq $ExpectedStatus -and $row[0].approval_status -eq $approval
  Add-Check ('P16-MATRIX-'+$id) $ok "rows=$($row.Count) status=$($row[0].current_status) approval=$($row[0].approval_status)"
}

$manifest=Read-Utf8 $evidenceManifest
foreach($required in @($paperHash,'August 22, 2024','74','2,705,436')){
  Add-Check ('P16-EVIDENCE-MANIFEST-'+$required.GetHashCode().ToString('X8')) $manifest.Contains($required) "required=$required"
}
$ignoredPdf=@(& git -C $repoRoot check-ignore -- 'paper/model_rebuild/evidence/shigu_2024_ssrn_4770849.pdf')
$ignoredText=@(& git -C $repoRoot check-ignore -- 'paper/model_rebuild/evidence/shigu_2024_ssrn_4770849_extracted.txt')
Add-Check 'P16-EVIDENCE-PDF-IGNORED' ($ignoredPdf.Count -eq 1) "result=$($ignoredPdf -join ';')"
Add-Check 'P16-EVIDENCE-TEXT-IGNORED' ($ignoredText.Count -eq 1) "result=$($ignoredText -join ';')"

$evidence=Read-Utf8 $evidenceNote
$verdicts=@{
 'SG-01'='VERIFIED'; 'SG-02'='VERIFIED'; 'SG-03'='VERIFIED';
 'SG-04'='VERIFIED'; 'SG-05'='VERIFIED WITH PRECISION LIMIT';
 'SG-06'='VERIFIED WITH PRECISION LIMIT'; 'SG-07'='VERIFIED'
}
foreach($id in $verdicts.Keys){
  $needle='| `'+$id+'` |'
  $row=@($evidence -split "`r?`n" | Where-Object {$_.StartsWith($needle)})
  $ok=$row.Count -eq 1 -and $row[0].Contains("| $($verdicts[$id]) |")
  Add-Check ('P16-EVIDENCE-'+$id) $ok "rows=$($row.Count) expected=$($verdicts[$id])"
}
foreach($required in @(
 'Table II','Table IX','PDF pages 45--52','No formal cross-column equality test',
 'There are no remaining `UNVERIFIED` v1.1 claims','patent applications',
 'outside the MAH baseline endogenous outcomes','architecture change follows'
)){
  Add-Check ('P16-EVIDENCE-TEXT-'+$required.GetHashCode().ToString('X8')) $evidence.Contains($required) "required=$required"
}
$issues=Read-Utf8 $issuesPath
Add-Check 'P16-EVIDENCE-ISSUE-CLOSED' ($issues.Contains('## RESOLVED — ISSUE-SPEC-001') -and $issues.Contains('Severity now: `CLOSED-EVIDENCE`')) 'ISSUE-SPEC-001 closed'

$main=Read-Utf8 $mainPath
foreach($required in @(
 '\subsection{Environment and timing}','\subsection{Commercialization technologies}',
 '\subsection{Organization and project advancement}',
 '\subsection{Qualified manufacturing-service equilibrium}',
 '\subsection{Main predictions}','project-advancement intensity',
 'excludes basic research','patent-generating effort','M\in\{0,1\}',
 '\tau_E(0)=+\infty','\arg\max_{r\in\{I,E,T,A\}}',
 'only through \(\Omega_i\)','fixed \(p_m\)','At equilibrium',
 '\rho_gF_g(q,m)','no original-versus-incremental ranking',
 'applications are not a baseline endogenous outcome'
)){
  Add-Check ('P16-MAIN-TEXT-'+$required.GetHashCode().ToString('X8')) $main.Contains($required) "required=$required"
}
foreach($required in @('p_m^*','x_i^*','r_i^*(q,m)','s_j^*')){
  Add-Check ('P16-MAIN-EQOBJ-'+$required.GetHashCode().ToString('X8')) $main.Contains($required) "required=$required"
}
foreach($forbidden in @('\eta','P_{ir}^{\mathrm{logit}}','x_i^R','x_i^D','\Gamma','\frac{\partial M','\partial x_i^*/\partial M')){
  Add-Check ('P16-MAIN-NO-'+$forbidden.GetHashCode().ToString('X8')) (-not $main.Contains($forbidden)) "forbidden=$forbidden"
}
Add-Check 'P16-MAIN-NO-EXTRA-CLOSURE' (-not $main.Contains('labor-market clearing') -and -not $main.Contains('capital-market clearing') -and -not $main.Contains('welfare maximization')) 'no additional baseline closure'

$appendix=Read-Utf8 $appendixPath
$expectedInputs=@(
 '01_primitives_and_timing.tex','02_demand_profit_derivation.tex','03_internal_external_technologies.tex',
 '04_route_values_and_sorting.tex','05_rd_problem.tex','06_cmo_supply_demand_equilibrium.tex',
 '07_equilibrium_definition.tex','08_required_propositions.tex','08_comparative_statics.tex',
 '09_observed_outcomes.tex','11_extensions_not_baseline.tex'
)
$inputs=@([regex]::Matches($appendix,'\\input\{([^}]+)\}')|ForEach-Object{$_.Groups[1].Value})
Add-Check 'P16-APPENDIX-INPUTS' (($inputs -join '|') -eq ($expectedInputs -join '|')) "inputs=$($inputs -join ';')"
foreach($required in @(
 'Research versus Development: Boundary of the Baseline','August 22, 2024 version',
 'Table II on p.~45','Table IV on p.~47','Table V, p.~48',
 'Table VIII, p.~51','Table VII, p.~50','Table IX, p.~52',
 'no formal cross-column equality test','outside the present fixed-population partial equilibrium',
 '\input{11_extensions_not_baseline.tex}'
)){
  Add-Check ('P16-APPENDIX-TEXT-'+$required.GetHashCode().ToString('X8')) $appendix.Contains($required) "required=$required"
}
$extensionPosition=$appendix.IndexOf('\input{11_extensions_not_baseline.tex}')
$boundaryPosition=$appendix.IndexOf('\section{Research versus Development: Boundary of the Baseline}')
Add-Check 'P16-APPENDIX-QUARANTINE-ORDER' ($boundaryPosition -ge 0 -and $extensionPosition -gt $boundaryPosition) "boundary=$boundaryPosition extensions=$extensionPosition"

$mainLabels=@([regex]::Matches($main,'\\label\{([^}]+)\}')|ForEach-Object{$_.Groups[1].Value})
$mainDuplicates=@($mainLabels|Group-Object|Where-Object Count -gt 1)
Add-Check 'P16-MAIN-LABELS-UNIQUE' ($mainDuplicates.Count -eq 0) "duplicates=$(@($mainDuplicates|ForEach-Object{$_.Name}) -join ';')"
$appendixLabels=[Collections.Generic.List[string]]::new()
foreach($input in $expectedInputs){
  $text=Read-Utf8 (Join-Path $modelRebuild $input)
  foreach($m in [regex]::Matches($text,'\\label\{([^}]+)\}')){$appendixLabels.Add($m.Groups[1].Value)}
}
foreach($m in [regex]::Matches($appendix,'\\label\{([^}]+)\}')){$appendixLabels.Add($m.Groups[1].Value)}
$appendixDuplicates=@($appendixLabels|Group-Object|Where-Object Count -gt 1)
Add-Check 'P16-APPENDIX-LABELS-UNIQUE' ($appendixDuplicates.Count -eq 0) "duplicates=$(@($appendixDuplicates|ForEach-Object{$_.Name}) -join ';')"

$split=Read-Utf8 $splitPath
foreach($required in @(
 'approved Phase','1--15 inputs','## Main-text candidate','## Appendix candidate',
 'Evidence-boundary addition','not activate','not a mathematical appendix component'
)){
  Add-Check ('P16-SPLIT-'+$required.GetHashCode().ToString('X8')) $split.Contains($required) "required=$required"
}
$independent=Read-Utf8 $independentPath
foreach($required in @(
 'Source and evidence integrity','Main-text candidate audit','Appendix candidate audit',
 'Compilation and scope','P0: 0','P1: 0','Independent gate: `PASS`'
)){
  Add-Check ('P16-INDEPENDENT-'+$required.GetHashCode().ToString('X8')) $independent.Contains($required) "required=$required"
}
$render=Read-Utf8 $renderPath
Add-Check 'P16-RENDER' ($render.Contains('| Main-text model candidate | 4 | 1, 2, 3, 4 | PASS |') -and $render.Contains('| Technical appendix candidate | 33 | 1, 2, 31, 32, 33 | PASS |') -and $render.Contains('No clipped text')) 'candidate render sample passed'

foreach($pair in @(@($mainLog,'P16-MAIN'),@($appendixLog,'P16-APPENDIX'))){
  $log=if(Test-Path -LiteralPath $pair[0]){Read-Utf8 $pair[0]}else{''}
  $fatal=@(@('! LaTeX Error:','Fatal error occurred','There were undefined references','multiply defined')|Where-Object{$log.Contains($_)})
  $boxes=@([regex]::Matches($log,'(?m)^(Overfull|Underfull) \\[hv]box')).Count
  Add-Check ($pair[1]+'-LATEX-FATAL') ($fatal.Count -eq 0 -and $log.Length -gt 0) "fatal=$($fatal -join ';')"
  Add-Check ($pair[1]+'-LATEX-BOXES') ($boxes -eq 0) "box_warnings=$boxes"
}

$pdfinfo='C:\Users\dongw\.cache\codex-runtimes\codex-primary-runtime\dependencies\native\poppler\Library\bin\pdfinfo.exe'
foreach($pair in @(@($mainPdf,'P16-MAIN-PDF-PAGES','4'),@($appendixPdf,'P16-APPENDIX-PDF-PAGES','33'))){
  $info=if(Test-Path -LiteralPath $pdfinfo){@(& $pdfinfo $pair[0])}else{@()}
  $pageLine=@($info|Where-Object{$_ -match '^Pages:'})|Select-Object -First 1
  Add-Check $pair[1] ($pageLine -match "Pages:\s+$($pair[2])$") "line=$pageLine"
}

$allowed=@(
 'paper/model_notes/00_model_closure_status.md','paper/model_notes/06_open_issues_log.md',
 'paper/model_notes/08_shigu_empirical_boundary_check.md','paper/model_rebuild/.gitignore',
 'paper/model_rebuild/13_main_text_model_candidate.tex','paper/model_rebuild/14_appendix_model_candidate.tex',
 'paper/model_rebuild/audit/phase16_artifact_hashes.md','paper/model_rebuild/audit/phase16_audit_results.json',
 'paper/model_rebuild/audit/phase16_commit_manifest.txt','paper/model_rebuild/audit/phase16_compile_console.txt',
 'paper/model_rebuild/audit/phase16_gate_report.md','paper/model_rebuild/audit/phase16_independent_split_audit.md',
 'paper/model_rebuild/audit/phase16_pdf_render_audit.md','paper/model_rebuild/audit/phase16_preflight.md',
 'paper/model_rebuild/audit/phase16_split_ledger.md',
 'paper/model_rebuild/evidence/shigu_2024_ssrn_4770849_manifest.md',
 'paper/model_rebuild/scripts/audit_phase16.ps1','paper/model_rebuild/scripts/compile_phase16_candidates.ps1',
 'paper/model_rebuild/spec/approvals/phase16_standing_authorization.md',
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
Add-Check 'P16-SCOPE-EXACT' ($unexpected.Count -eq 0) "unexpected=$($unexpected -join ';')"

if($ExpectedStatus -in @('READY_FOR_APPROVAL','APPROVED')){
  $gate=if(Test-Path -LiteralPath $gatePath){Read-Utf8 $gatePath}else{''}
  $ids=@(
   'RL-01','RL-28','P16-D01','P16-G01','QA-PROOF-01','QA-PROOF-10',
   'QA-ECON-01','QA-ECON-08','SUCCESS-01','SUCCESS-13','SG-01','SG-07'
  )
  $missingGate=@($ids|Where-Object{-not $gate.Contains($_)})
  Add-Check 'P16-GATE-IDS' ($missingGate.Count -eq 0) "missing=$($missingGate -join ';')"
  Add-Check 'P16-GATE-RESULT' ($gate.Contains('P0: 0') -and $gate.Contains('P1: 0') -and $gate.Contains('Overall gate: PASS')) 'gate PASS'
}

$failed=@($checks|Where-Object{-not $_.passed})
$result=[ordered]@{
 phase=16
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
