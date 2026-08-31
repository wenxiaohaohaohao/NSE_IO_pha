[CmdletBinding()]
param([Parameter(Mandatory=$true)][ValidateSet('IN_PROGRESS','READY_FOR_APPROVAL','APPROVED')][string]$ExpectedStatus)
Set-StrictMode -Version Latest
$ErrorActionPreference='Stop'
$modelRebuild=Split-Path -Parent $PSScriptRoot
$paperRoot=Split-Path -Parent $modelRebuild
$repoRoot=Split-Path -Parent $paperRoot
$auditRoot=Join-Path $modelRebuild 'audit'
$specRoot=Join-Path $modelRebuild 'spec'
$sourceRoot=Join-Path $specRoot 'source'
$notesRoot=Join-Path $paperRoot 'model_notes'
$formalPath=Join-Path $modelRebuild '10_empirical_mapping.tex'
$statusPath=Join-Path $notesRoot '00_model_closure_status.md'
$symbolsPath=Join-Path $notesRoot '01_symbols_and_objects.md'
$dependencyPath=Join-Path $notesRoot '02_equation_dependency_map.md'
$assumptionsPath=Join-Path $notesRoot '03_assumptions_and_scope.md'
$issuesPath=Join-Path $notesRoot '06_open_issues_log.md'
$matrixPath=Join-Path $specRoot 'instruction_traceability_matrix.csv'
$gateReportPath=Join-Path $auditRoot 'phase10_gate_report.md'
$independentPath=Join-Path $auditRoot 'phase10_independent_mapping_audit.md'
$latexLogPath=Join-Path $auditRoot 'build_phase10\phase10_compile_wrapper.log'
$pdfPath=Join-Path $auditRoot 'build_phase10\phase10_compile_wrapper.pdf'
$jsonPath=Join-Path $auditRoot 'phase10_audit_results.json'
$lockedBase='cd5b6e49608749e0bf32f3d9aa235a84f378347b'
$entryCommit='fd23ee8505a977217762c11b5544354995344612'
$checks=[System.Collections.Generic.List[object]]::new()
function Add-Check{param([string]$Id,[bool]$Passed,[string]$Evidence);$checks.Add([pscustomobject]@{id=$Id;passed=$Passed;evidence=$Evidence})}
function Test-Hash{param([string]$Id,[string]$Path,[string]$Expected);$actual=if(Test-Path -LiteralPath $Path -PathType Leaf){(Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash}else{'MISSING'};Add-Check $Id ($actual -eq $Expected) "expected=$Expected actual=$actual"}
foreach($s in @(
 @('P10-HASH-BASE','MAH_model_rebuild_execution_note_for_Codex.md','F6C11377D71E4E25D40FFB8AC9FE2EA7AA051AD7E123BA7E3A32DBA895342B24'),
 @('P10-HASH-AMD11','MAH_model_rebuild_amendment_v1.1_for_Codex.md','D76856241E460D31087AB60690E85D5681806E53BD42991F725458727CCD1EA9'),
 @('P10-HASH-AMD12-IMAGE','MAH_model_rebuild_correction_v1.2.png','1C0035AB49A5FF5C207CB71C1E3F04CFAC4E333BEDDAB73841D2A72F603723E5'),
 @('P10-HASH-AMD12-TEXT','MAH_model_rebuild_correction_v1.2_transcription.md','06AF48B2D853EA82F7176505D2ACA4D0CBFE06E5DB52C18026308196FE85E48E')
)){Test-Hash $s[0] (Join-Path $sourceRoot $s[1]) $s[2]}
Test-Hash 'P10-HASH-EFFECTIVE' (Join-Path $specRoot 'MAH_model_rebuild_effective_spec_v1.2.md') '855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666'
$branch=(& git -C $repoRoot branch --show-current).Trim();$head=(& git -C $repoRoot rev-parse HEAD).Trim();$remote=(& git -C $repoRoot rev-parse origin/codex/mah-model-rebuild).Trim()
Add-Check 'P10-GIT-BRANCH' ($branch -eq 'codex/mah-model-rebuild') "branch=$branch";Add-Check 'P10-GIT-ENTRY' ($head -eq $entryCommit) "head=$head";Add-Check 'P10-GIT-REMOTE' ($remote -eq $head) "remote=$remote"
$manuscriptDiff=@(& git -C $repoRoot diff --name-only $lockedBase -- paper/manuscript);$zipStatus=@(& git -C $repoRoot status --porcelain=v1 -- paper/collaboration/MAH_model_update_20260717.zip)
Add-Check 'P10-MANUSCRIPT-READ-ONLY' ($manuscriptDiff.Count -eq 0) "changed=$($manuscriptDiff -join ';')";Add-Check 'P10-ZIP-ISOLATED' ($zipStatus.Count -eq 0) "count=$($zipStatus.Count)"
foreach($path in @($formalPath,(Join-Path $auditRoot 'phase10_preflight.md'),$independentPath,(Join-Path $auditRoot 'phase10_compile_wrapper.tex'),(Join-Path $auditRoot 'phase10_compile_console.txt'),$latexLogPath,$pdfPath,$symbolsPath,$dependencyPath,$assumptionsPath)){Add-Check ('P10-FILE-'+[System.IO.Path]::GetFileName($path)) (Test-Path -LiteralPath $path -PathType Leaf) "path=$path"}
$statusText=[IO.File]::ReadAllText($statusPath,[Text.Encoding]::UTF8);$statusNeedle="| 10 Empirical mapping | $($ExpectedStatus -replace '_',' ') |"
Add-Check 'P10-STATE-PHASE9' $statusText.Contains('| 9 Outcomes/data boundary | APPROVED |') 'Phase 9 approved';Add-Check 'P10-STATE-PHASE10' $statusText.Contains($statusNeedle) "expected=$statusNeedle";Add-Check 'P10-STATE-PHASE11' $statusText.Contains('| 11 Extensions | NOT STARTED |') 'Phase 11 not started';Add-Check 'P10-GOVERNANCE' $statusText.Contains('EXEC-GOV-001') 'standing authorization'
$matrix=Import-Csv -LiteralPath $matrixPath;$expectedApproval=if($ExpectedStatus -eq 'APPROVED'){'YES'}else{'NO'}
foreach($id in @('P10-D01','P10-G01')){$row=@($matrix|Where-Object requirement_id -eq $id);$rs=if($row.Count -eq 1){$row[0].current_status}else{'BAD_ROW'};$ra=if($row.Count -eq 1){$row[0].approval_status}else{'BAD_ROW'};Add-Check ('P10-MATRIX-'+$id) ($row.Count -eq 1 -and $rs -eq $ExpectedStatus -and $ra -eq $expectedApproval) "status=$rs approval=$ra"}
$formalText=[IO.File]::ReadAllText($formalPath,[Text.Encoding]::UTF8);$symbolsText=[IO.File]::ReadAllText($symbolsPath,[Text.Encoding]::UTF8);$dependencyText=[IO.File]::ReadAllText($dependencyPath,[Text.Encoding]::UTF8);$assumptionsText=[IO.File]::ReadAllText($assumptionsPath,[Text.Encoding]::UTF8);$independentText=[IO.File]::ReadAllText($independentPath,[Text.Encoding]::UTF8);$issuesText=[IO.File]::ReadAllText($issuesPath,[Text.Encoding]::UTF8)
$interfaces=@([regex]::Matches($formalText,'\\subsubsection\{Interface ([0-9]+):'));$numbers=@($interfaces|ForEach-Object{[int]$_.Groups[1].Value})
Add-Check 'P10-INTERFACE-COUNT' ($interfaces.Count -eq 12 -and ($numbers -join ',') -eq '1,2,3,4,5,6,7,8,9,10,11,12') "numbers=$($numbers -join ',')"
foreach($field in @('\textit{Meaning:}','\textit{Candidate measure:}','\textit{Unit:}','\textit{Grain:}','\textit{Required keys:}','\textit{Availability:}','\textit{Identification limit:}')){$count=@([regex]::Matches($formalText,[regex]::Escape($field))).Count;Add-Check ('P10-FIELD-'+($field.GetHashCode().ToString('X8'))) ($count -eq 12) "field=$field count=$count"}
foreach($label in @('eq:p10-anticipated-interface','eq:p10-realized-interface')){Add-Check ('P10-LABEL-'+$label) $formalText.Contains("\label{$label}") "label=$label"}
foreach($needle in @(
 'Predetermined research capability','Advancement intensity','Planning-stage projects','Internal manufacturing capability','Project value','Manufacturing complexity',
 'Retained entrusted route','Realized retained outcome','Novelty class','Patent applications','CMO price or scarcity','Transfer outside option',
 'NOT VERIFIED','NOT DIRECTLY OBSERVED','FUTURE INTERFACE','holder identifier','manufacturer identifier','product identifier','effective date',
 'separately identify \(a_i\)','not \(x_i\)','not approval or launch','not automatically route \(E\)','No empirical data set'
)){Add-Check ('P10-FORMAL-'+($needle.GetHashCode().ToString('X8'))) $formalText.Contains($needle) "required=$needle"}
foreach($pattern in @('\\eta\b','\\frac\{\\exp\{','inclusive\s+value\s*=','x_\{ig\}\s*=','data\s+are\s+available','we\s+observe','sample\s+contains')){$m=[regex]::Match($formalText,$pattern,[Text.RegularExpressions.RegexOptions]::IgnoreCase);Add-Check ('P10-FORBID-'+($pattern.GetHashCode().ToString('X8'))) (-not $m.Success) "pattern=$pattern match=$($m.Value)"}
Add-Check 'P10-NO-NEW-SYMBOL' ($symbolsText.Contains('10 adds empirical interface contracts but no model object') -and $symbolsText.Contains('There are 83 active rows.')) 'no model object'
foreach($id in @('P10-I01','P10-I02','P10-I03','P10-I04','P10-I05','P10-I06','P10-E01','P10-E02')){Add-Check ('P10-DEPENDENCY-'+$id) $dependencyText.Contains($id) "required=$id"}
Add-Check 'P10-NO-NEW-ASSUMPTION' $assumptionsText.Contains('Phase 10 adds no theoretical assumption') 'interfaces are conditional';Add-Check 'P10-INDEPENDENT' ($independentText.Contains('Independent review conclusion: no P0 and no P1') -and $independentText.Contains('## 3. Availability discipline')) 'independent audit';Add-Check 'P10-NO-P0' (-not $issuesText.Contains('Phase: Phase 10') -and -not($issuesText -match 'Severity now:.*P0')) 'no Phase 10 P0'
$allTex=1..10|ForEach-Object{$tag='{0:D2}' -f $_;$file=Get-ChildItem -LiteralPath $modelRebuild -Filter ($tag+'_*.tex')|Select-Object -First 1;[IO.File]::ReadAllText($file.FullName,[Text.Encoding]::UTF8)};$labels=@([regex]::Matches(($allTex -join [Environment]::NewLine),'\\label\{([^}]+)\}')|ForEach-Object{$_.Groups[1].Value});$duplicates=@($labels|Group-Object|Where-Object Count -gt 1|ForEach-Object Name);Add-Check 'P10-LABEL-UNIQUE' ($duplicates.Count -eq 0) "duplicates=$($duplicates -join ';')"
$logText=if(Test-Path -LiteralPath $latexLogPath){[IO.File]::ReadAllText($latexLogPath,[Text.Encoding]::UTF8)}else{''};$fatal=@(@('! LaTeX Error:','Fatal error occurred','There were undefined references','multiply defined')|Where-Object{$logText.Contains($_)});$boxes=@([regex]::Matches($logText,'(?m)^(Overfull|Underfull) \\[hv]box')).Count;Add-Check 'P10-LATEX-FATAL' ($fatal.Count -eq 0 -and $logText.Length -gt 0) "fatal=$($fatal -join ';')";Add-Check 'P10-LATEX-BOXES' ($boxes -eq 0) "box_warnings=$boxes"
$allowed=@('paper/model_notes/00_model_closure_status.md','paper/model_notes/01_symbols_and_objects.md','paper/model_notes/02_equation_dependency_map.md','paper/model_notes/03_assumptions_and_scope.md','paper/model_rebuild/.gitattributes','paper/model_rebuild/10_empirical_mapping.tex','paper/model_rebuild/audit/phase10_artifact_hashes.md','paper/model_rebuild/audit/phase10_audit_results.json','paper/model_rebuild/audit/phase10_commit_manifest.txt','paper/model_rebuild/audit/phase10_compile_console.txt','paper/model_rebuild/audit/phase10_compile_wrapper.tex','paper/model_rebuild/audit/phase10_gate_report.md','paper/model_rebuild/audit/phase10_independent_mapping_audit.md','paper/model_rebuild/audit/phase10_preflight.md','paper/model_rebuild/scripts/audit_phase10.ps1','paper/model_rebuild/spec/approvals/phase10_standing_authorization.md','paper/model_rebuild/spec/instruction_traceability_matrix.csv','paper/model_rebuild/spec/specification_hashes.md')
$allowedSet=[Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase);foreach($p in $allowed){[void]$allowedSet.Add($p)};$unexpected=[Collections.Generic.List[string]]::new();foreach($line in @(& git -C $repoRoot status --porcelain=v1 --untracked-files=all)){if([string]::IsNullOrWhiteSpace($line)){continue};$path=$line.Substring(3).Replace('\','/');if(-not $allowedSet.Contains($path)){$unexpected.Add($path)}};Add-Check 'P10-SCOPE-EXACT' ($unexpected.Count -eq 0) "unexpected=$($unexpected -join ';')"
if($ExpectedStatus -in @('READY_FOR_APPROVAL','APPROVED')){$gateText=if(Test-Path -LiteralPath $gateReportPath){[IO.File]::ReadAllText($gateReportPath,[Text.Encoding]::UTF8)}else{''};$ids=@('RL-01','RL-28','P10-D01','P10-G01','QA-PROOF-05','QA-PROOF-07','QA-PROOF-10','QA-ECON-02','QA-ECON-03','QA-ECON-05','QA-ECON-06','QA-ECON-07');$missing=@($ids|Where-Object{-not $gateText.Contains($_)});Add-Check 'P10-GATE-IDS' ($missing.Count -eq 0) "missing=$($missing -join ';')";Add-Check 'P10-GATE-RESULT' ($gateText.Contains('P0: 0') -and $gateText.Contains('Overall gate: PASS')) 'gate PASS'}
$failed=@($checks|Where-Object{-not $_.passed});$result=[ordered]@{phase=10;expected_status=$ExpectedStatus;status=if($failed.Count -eq 0){$ExpectedStatus}else{'AUDIT_FAILED'};generated_at=(Get-Date).ToString('o');passed=@($checks|Where-Object passed).Count;failed=$failed.Count;checks=$checks};[IO.File]::WriteAllText($jsonPath,($result|ConvertTo-Json -Depth 6)+[Environment]::NewLine,[Text.UTF8Encoding]::new($false));Write-Output "SUMMARY status=$($result.status) passed=$($result.passed) failed=$($result.failed) report=$jsonPath";foreach($item in $failed){Write-Output "FAIL $($item.id): $($item.evidence)"};if($failed.Count -gt 0){exit 1}
