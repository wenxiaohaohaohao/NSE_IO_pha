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
$assumptionPath=Join-Path $notesRoot '03_assumptions_and_scope.md'
$checklistPath=Join-Path $notesRoot '04_proposition_checklist.md'
$statusPath=Join-Path $notesRoot '00_model_closure_status.md'
$matrixPath=Join-Path $specRoot 'instruction_traceability_matrix.csv'
$independentPath=Join-Path $auditRoot 'phase14_independent_assumption_audit.md'
$gateReportPath=Join-Path $auditRoot 'phase14_gate_report.md'
$latexLogPath=Join-Path $auditRoot 'build_phase14\phase14_compile_wrapper.log'
$pdfPath=Join-Path $auditRoot 'build_phase14\phase14_compile_wrapper.pdf'
$jsonPath=Join-Path $auditRoot 'phase14_audit_results.json'
$lockedBase='cd5b6e49608749e0bf32f3d9aa235a84f378347b'
$entryCommit='802963da6a7634f71aabac128069cdc51affdd77'
$checks=[Collections.Generic.List[object]]::new()

function Add-Check([string]$Id,[bool]$Passed,[string]$Evidence) {
  $checks.Add([pscustomobject]@{id=$Id;passed=$Passed;evidence=$Evidence})
}
function Test-Hash([string]$Id,[string]$Path,[string]$Expected) {
  $actual=if(Test-Path -LiteralPath $Path -PathType Leaf){(Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash}else{'MISSING'}
  Add-Check $Id ($actual -eq $Expected) "expected=$Expected actual=$actual"
}

foreach($source in @(
  @('P14-HASH-BASE','MAH_model_rebuild_execution_note_for_Codex.md','F6C11377D71E4E25D40FFB8AC9FE2EA7AA051AD7E123BA7E3A32DBA895342B24'),
  @('P14-HASH-AMD11','MAH_model_rebuild_amendment_v1.1_for_Codex.md','D76856241E460D31087AB60690E85D5681806E53BD42991F725458727CCD1EA9'),
  @('P14-HASH-AMD12-IMAGE','MAH_model_rebuild_correction_v1.2.png','1C0035AB49A5FF5C207CB71C1E3F04CFAC4E333BEDDAB73841D2A72F603723E5'),
  @('P14-HASH-AMD12-TEXT','MAH_model_rebuild_correction_v1.2_transcription.md','06AF48B2D853EA82F7176505D2ACA4D0CBFE06E5DB52C18026308196FE85E48E')
)){Test-Hash $source[0] (Join-Path $sourceRoot $source[1]) $source[2]}
Test-Hash 'P14-HASH-EFFECTIVE' (Join-Path $specRoot 'MAH_model_rebuild_effective_spec_v1.2.md') '855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666'

$branch=(& git -C $repoRoot branch --show-current).Trim()
$head=(& git -C $repoRoot rev-parse HEAD).Trim()
$remote=(& git -C $repoRoot rev-parse origin/codex/mah-model-rebuild).Trim()
Add-Check 'P14-GIT-BRANCH' ($branch -eq 'codex/mah-model-rebuild') "branch=$branch"
Add-Check 'P14-GIT-ENTRY' ($head -eq $entryCommit) "head=$head"
Add-Check 'P14-GIT-REMOTE' ($remote -eq $head) "remote=$remote"
$manuscriptDiff=@(& git -C $repoRoot diff --name-only $lockedBase -- paper/manuscript)
$zipStatus=@(& git -C $repoRoot status --porcelain=v1 -- paper/collaboration/MAH_model_update_20260717.zip)
Add-Check 'P14-MANUSCRIPT-READ-ONLY' ($manuscriptDiff.Count -eq 0) "changed=$($manuscriptDiff -join ';')"
Add-Check 'P14-ZIP-ISOLATED' ($zipStatus.Count -eq 0) "count=$($zipStatus.Count)"

foreach($path in @(
  $assumptionPath,$checklistPath,(Join-Path $auditRoot 'phase14_preflight.md'),$independentPath,
  (Join-Path $auditRoot 'phase14_compile_wrapper.tex'),(Join-Path $auditRoot 'phase14_compile_console.txt'),
  $latexLogPath,$pdfPath
)){Add-Check ('P14-FILE-'+[IO.Path]::GetFileName($path)) (Test-Path -LiteralPath $path -PathType Leaf) "path=$path"}

$statusText=[IO.File]::ReadAllText($statusPath,[Text.Encoding]::UTF8)
$statusNeedle="| 14 Assumption discipline | $($ExpectedStatus -replace '_',' ') |"
Add-Check 'P14-STATE-P13' $statusText.Contains('| 13 Equation dependency map | APPROVED |') 'Phase 13 approved'
Add-Check 'P14-STATE-P14' $statusText.Contains($statusNeedle) "expected=$statusNeedle"
Add-Check 'P14-STATE-P15' $statusText.Contains('| 15 Comparative statics/full draft | NOT STARTED |') 'Phase 15 not started'
$matrix=Import-Csv -LiteralPath $matrixPath
$expectedApproval=if($ExpectedStatus -eq 'APPROVED'){'YES'}else{'NO'}
foreach($id in @('P14-D01','P14-G01')){
  $row=@($matrix|Where-Object requirement_id -eq $id)
  $ok=$row.Count -eq 1 -and $row[0].current_status -eq $ExpectedStatus -and $row[0].approval_status -eq $expectedApproval
  Add-Check ('P14-MATRIX-'+$id) $ok "rows=$($row.Count)"
}

$text=[IO.File]::ReadAllText($assumptionPath,[Text.Encoding]::UTF8)
$lines=[IO.File]::ReadAllLines($assumptionPath,[Text.Encoding]::UTF8)
$expectedHeadings=@(
  '## A. Demand and commercial-return assumptions','## B. Manufacturing technology assumptions',
  '## C. Project-advancement assumptions','## D. CMO-market regularity assumptions'
)
$headings=@($lines|Where-Object{$_ -match '^## [A-D]\.'})
Add-Check 'P14-FOUR-BLOCKS' (($headings -join '|') -eq ($expectedHeadings -join '|')) "headings=$($headings -join ';')"

$expectedCanonical=@(
 'A-DEM-01','A-DEM-02','A-DEM-03','B-MFG-01','B-MFG-02','B-MFG-03','B-MFG-04','B-MFG-05',
 'C-ADV-01','C-ADV-02','C-ADV-03','C-ADV-04','C-ADV-05','C-ADV-06','D-CMO-01','D-CMO-02','D-CMO-03','D-CMO-04'
)
$canonical=[Collections.Generic.List[string]]::new()
foreach($line in $lines){
  $m=[regex]::Match($line,'^### \x60((?:A-DEM|B-MFG|C-ADV|D-CMO)-\d{2})\x60')
  if($m.Success){$canonical.Add($m.Groups[1].Value)}
}
Add-Check 'P14-CANONICAL-COUNT' ($canonical.Count -eq 18) "count=$($canonical.Count)"
Add-Check 'P14-CANONICAL-EXACT' ((@($canonical|Sort-Object)-join ',') -eq (@($expectedCanonical|Sort-Object)-join ',')) "ids=$($canonical -join ',')"

$expectedLegacy=@(
 'A-P01-FIRM-01','A-P01-FIRM-02','A-P01-FIRM-03','A-P01-INST-01','A-P01-INST-02','A-P01-INST-03',
 'A-P01-PROJ-01','A-P01-PROJ-02','A-P01-PROJ-03','A-P01-PROJ-04','A-P01-SCOPE-01','A-P01-SCOPE-02','A-P01-SCOPE-03',
 'A-P01-TIME-01','A-P01-TIME-02','A-P01-TIME-03','A-P01-TIME-04','A-P02-ACCOUNT-01','A-P02-DEMAND-01','A-P02-POLICY-01','A-P02-PRICE-01','A-P02-PV-01',
 'A-P03-EXT-01','A-P03-EXT-02','A-P03-HOLDER-01','A-P03-INT-01','A-P03-INT-02','A-P03-POLICY-01','A-P03-SCARCITY-01',
 'A-P04-CHOICE-01','A-P04-CUTOFF-01','A-P04-CUTOFF-02','A-P04-OUTSIDE-01','A-P04-POLICY-01','A-P04-PRICE-01',
 'A-P05-CHANNEL-01','A-P05-COST-01','A-P05-GAP-01','A-P05-TIME-01','A-P05-VALUE-01',
 'A-P06-AGG-01','A-P06-BACKGROUND-01','A-P06-PRICE-01','A-P06-SUPPLY-01','A-P08-HET-01','A-P08-OBS-01'
)
$legacy=[Collections.Generic.List[string]]::new()
foreach($line in $lines){
  $m=[regex]::Match($line,'^\| \x60(A-P\d{2}-[A-Z]+-\d{2})\x60 \|')
  if($m.Success){$legacy.Add($m.Groups[1].Value)}
}
Add-Check 'P14-LEGACY-COUNT' ($legacy.Count -eq 46) "count=$($legacy.Count)"
Add-Check 'P14-LEGACY-EXACT' ((@($legacy|Sort-Object)-join ',') -eq (@($expectedLegacy|Sort-Object)-join ',')) 'all legacy IDs mapped'

$refs=[Collections.Generic.List[string]]::new()
foreach($file in Get-ChildItem -LiteralPath $notesRoot -Filter '*.md'|Where-Object FullName -ne $assumptionPath){
  $other=[IO.File]::ReadAllText($file.FullName,[Text.Encoding]::UTF8)
  foreach($m in [regex]::Matches($other,'A-P\d{2}-[A-Z]+-\d{2}')){$refs.Add($m.Value)}
}
$orphans=@($refs|Sort-Object -Unique|Where-Object{$_ -notin $legacy})
Add-Check 'P14-NO-ORPHAN-LEGACY' ($orphans.Count -eq 0) "orphans=$($orphans -join ';')"

$propRows=@($lines|Where-Object{$_ -match '^\| (Proposition [1-6]:|Novelty corollary \|)'})
Add-Check 'P14-PROP-MATRIX-COUNT' ($propRows.Count -eq 7) "rows=$($propRows.Count)"
foreach($token in @('Proposition 1:','Proposition 2:','Proposition 3:','Proposition 4:','Proposition 5:','Proposition 6:','Novelty corollary')){
  Add-Check ('P14-PROP-'+$token.Replace(' ','-').Replace(':','')) ((@($propRows|Where-Object{$_.Contains($token)})).Count -eq 1) "token=$token"
}

foreach($required in @(
 'Primitive','Maintained regularity','Optimization-derived','Derived conclusion','Architecture restriction',
 'original-drug innovation investment /','project-advancement intensity','not patent applications',
 'There is no \(x_{ig}\)','no ordering of class-specific reform gains',
 'Fixed candidate price and equilibrium price','No class ranking or patent increase',
 'Failure of a sufficient condition','one common \(x_i\)'
)){Add-Check ('P14-TEXT-'+$required.GetHashCode().ToString('X8')) $text.Contains($required) "required=$required"}

$start=$text.IndexOf('## A. Demand and commercial-return assumptions')
$end=$text.IndexOf('## 2. Architecture guards')
$canonicalBlock=if($start -ge 0 -and $end -gt $start){$text.Substring($start,$end-$start)}else{''}
foreach($forbidden in @(
 'MAH raises patent applications','patent applications increase','route E is always chosen',
 'assume that the cutoff exists','assume p_m^*(1)','\partial x_i/\partial M',
 'x_{ig}\geq0','\Delta\Omega_{iO}>\Delta\Omega_{i\mathrm{Inc}}'
)){Add-Check ('P14-NO-CONCLUSION-'+$forbidden.GetHashCode().ToString('X8')) (-not $canonicalBlock.Contains($forbidden)) "forbidden=$forbidden"}

$checklist=[IO.File]::ReadAllText($checklistPath,[Text.Encoding]::UTF8)
Add-Check 'P14-CHECKLIST-CANONICAL' (-not [regex]::IsMatch($checklist,'A-P\d{2}-[A-Z]+-\d{2}')) 'no legacy IDs'
foreach($id in @('A-DEM-01','B-MFG-05','C-ADV-06','D-CMO-04','ARCH-07')){
  Add-Check ('P14-CHECKLIST-'+$id) $checklist.Contains($id) "required=$id"
}
$independent=[IO.File]::ReadAllText($independentPath,[Text.Encoding]::UTF8)
Add-Check 'P14-INDEPENDENT' ($independent.Contains('no P0 and no P1') -and $independent.Contains('All 46 legacy IDs are mapped exactly once') -and $independent.Contains('desired conclusions have not')) 'independent audit'

$latexLog=if(Test-Path -LiteralPath $latexLogPath){[IO.File]::ReadAllText($latexLogPath,[Text.Encoding]::UTF8)}else{''}
$fatal=@(@('! LaTeX Error:','Fatal error occurred','There were undefined references','multiply defined')|Where-Object{$latexLog.Contains($_)})
$boxes=@([regex]::Matches($latexLog,'(?m)^(Overfull|Underfull) \\[hv]box')).Count
Add-Check 'P14-LATEX-FATAL' ($fatal.Count -eq 0 -and $latexLog.Length -gt 0) "fatal=$($fatal -join ';')"
Add-Check 'P14-LATEX-BOXES' ($boxes -eq 0) "box_warnings=$boxes"

$allowed=@(
 'paper/model_notes/00_model_closure_status.md','paper/model_notes/03_assumptions_and_scope.md','paper/model_notes/04_proposition_checklist.md',
 'paper/model_rebuild/.gitattributes','paper/model_rebuild/audit/phase14_artifact_hashes.md','paper/model_rebuild/audit/phase14_audit_results.json',
 'paper/model_rebuild/audit/phase14_commit_manifest.txt','paper/model_rebuild/audit/phase14_compile_console.txt','paper/model_rebuild/audit/phase14_compile_wrapper.tex',
 'paper/model_rebuild/audit/phase14_gate_report.md','paper/model_rebuild/audit/phase14_independent_assumption_audit.md','paper/model_rebuild/audit/phase14_preflight.md',
 'paper/model_rebuild/scripts/audit_phase14.ps1','paper/model_rebuild/spec/approvals/phase14_standing_authorization.md',
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
Add-Check 'P14-SCOPE-EXACT' ($unexpected.Count -eq 0) "unexpected=$($unexpected -join ';')"

if($ExpectedStatus -in @('READY_FOR_APPROVAL','APPROVED')){
  $gate=if(Test-Path -LiteralPath $gateReportPath){[IO.File]::ReadAllText($gateReportPath,[Text.Encoding]::UTF8)}else{''}
  $ids=@('RL-01','RL-28','P14-D01','P14-G01','QA-PROOF-01','QA-PROOF-02','QA-PROOF-05','QA-PROOF-06','QA-PROOF-07','QA-PROOF-09','QA-PROOF-10','QA-ECON-01','QA-ECON-04','QA-ECON-05')
  $missing=@($ids|Where-Object{-not $gate.Contains($_)})
  Add-Check 'P14-GATE-IDS' ($missing.Count -eq 0) "missing=$($missing -join ';')"
  Add-Check 'P14-GATE-RESULT' ($gate.Contains('P0: 0') -and $gate.Contains('Overall gate: PASS')) 'gate PASS'
}

$failed=@($checks|Where-Object{-not $_.passed})
$result=[ordered]@{
 phase=14;expected_status=$ExpectedStatus;status=if($failed.Count -eq 0){$ExpectedStatus}else{'AUDIT_FAILED'}
 generated_at=(Get-Date).ToString('o');passed=@($checks|Where-Object passed).Count;failed=$failed.Count;checks=$checks
}
[IO.File]::WriteAllText($jsonPath,($result|ConvertTo-Json -Depth 6)+[Environment]::NewLine,[Text.UTF8Encoding]::new($false))
Write-Output "SUMMARY status=$($result.status) passed=$($result.passed) failed=$($result.failed) report=$jsonPath"
foreach($item in $failed){Write-Output "FAIL $($item.id): $($item.evidence)"}
if($failed.Count -gt 0){exit 1}
