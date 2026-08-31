[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [ValidateSet('IN_PROGRESS', 'READY_FOR_APPROVAL', 'APPROVED')]
    [string]$ExpectedStatus
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$modelRebuild = Split-Path -Parent $PSScriptRoot
$paperRoot = Split-Path -Parent $modelRebuild
$repoRoot = Split-Path -Parent $paperRoot
$auditRoot = Join-Path $modelRebuild 'audit'
$specRoot = Join-Path $modelRebuild 'spec'
$sourceRoot = Join-Path $specRoot 'source'
$notesRoot = Join-Path $paperRoot 'model_notes'
$formalPath = Join-Path $modelRebuild '07_equilibrium_definition.tex'
$statusPath = Join-Path $notesRoot '00_model_closure_status.md'
$symbolsPath = Join-Path $notesRoot '01_symbols_and_objects.md'
$dependencyPath = Join-Path $notesRoot '02_equation_dependency_map.md'
$assumptionsPath = Join-Path $notesRoot '03_assumptions_and_scope.md'
$issuesPath = Join-Path $notesRoot '06_open_issues_log.md'
$matrixPath = Join-Path $specRoot 'instruction_traceability_matrix.csv'
$gateReportPath = Join-Path $auditRoot 'phase07_gate_report.md'
$independentPath = Join-Path $auditRoot 'phase07_independent_definition_audit.md'
$latexLogPath = Join-Path $auditRoot 'build_phase07\phase07_compile_wrapper.log'
$pdfPath = Join-Path $auditRoot 'build_phase07\phase07_compile_wrapper.pdf'
$jsonPath = Join-Path $auditRoot 'phase07_audit_results.json'
$lockedBase = 'cd5b6e49608749e0bf32f3d9aa235a84f378347b'
$entryCommit = '3db38d4d2530e51f56898a97da403ef930b682e5'

$checks = [System.Collections.Generic.List[object]]::new()
function Add-Check {
    param([string]$Id, [bool]$Passed, [string]$Evidence)
    $checks.Add([pscustomobject]@{ id = $Id; passed = $Passed; evidence = $Evidence })
}
function Test-Hash {
    param([string]$Id, [string]$Path, [string]$Expected)
    $actual = if (Test-Path -LiteralPath $Path -PathType Leaf) { (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash } else { 'MISSING' }
    Add-Check $Id ($actual -eq $Expected) "expected=$Expected actual=$actual"
}

foreach ($spec in @(
    @('P07-HASH-BASE','MAH_model_rebuild_execution_note_for_Codex.md','F6C11377D71E4E25D40FFB8AC9FE2EA7AA051AD7E123BA7E3A32DBA895342B24'),
    @('P07-HASH-AMD11','MAH_model_rebuild_amendment_v1.1_for_Codex.md','D76856241E460D31087AB60690E85D5681806E53BD42991F725458727CCD1EA9'),
    @('P07-HASH-AMD12-IMAGE','MAH_model_rebuild_correction_v1.2.png','1C0035AB49A5FF5C207CB71C1E3F04CFAC4E333BEDDAB73841D2A72F603723E5'),
    @('P07-HASH-AMD12-TEXT','MAH_model_rebuild_correction_v1.2_transcription.md','06AF48B2D853EA82F7176505D2ACA4D0CBFE06E5DB52C18026308196FE85E48E')
)) { Test-Hash $spec[0] (Join-Path $sourceRoot $spec[1]) $spec[2] }
Test-Hash 'P07-HASH-EFFECTIVE' (Join-Path $specRoot 'MAH_model_rebuild_effective_spec_v1.2.md') '855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666'

$branch = (& git -C $repoRoot branch --show-current).Trim()
$head = (& git -C $repoRoot rev-parse HEAD).Trim()
$remote = (& git -C $repoRoot rev-parse origin/codex/mah-model-rebuild).Trim()
Add-Check 'P07-GIT-BRANCH' ($branch -eq 'codex/mah-model-rebuild') "branch=$branch"
Add-Check 'P07-GIT-ENTRY' ($head -eq $entryCommit) "head=$head"
Add-Check 'P07-GIT-REMOTE' ($remote -eq $head) "remote=$remote"
$manuscriptDiff = @(& git -C $repoRoot diff --name-only $lockedBase -- paper/manuscript)
$zipStatus = @(& git -C $repoRoot status --porcelain=v1 -- paper/collaboration/MAH_model_update_20260717.zip)
Add-Check 'P07-MANUSCRIPT-READ-ONLY' ($manuscriptDiff.Count -eq 0) "changed=$($manuscriptDiff -join ';')"
Add-Check 'P07-ZIP-ISOLATED' ($zipStatus.Count -eq 0) "count=$($zipStatus.Count)"

foreach ($path in @(
    $formalPath,(Join-Path $auditRoot 'phase07_preflight.md'),$independentPath,
    (Join-Path $auditRoot 'phase07_compile_wrapper.tex'),
    (Join-Path $auditRoot 'phase07_compile_console.txt'),$latexLogPath,$pdfPath,
    $symbolsPath,$dependencyPath,$assumptionsPath
)) {
    Add-Check ('P07-FILE-' + [System.IO.Path]::GetFileName($path)) (Test-Path -LiteralPath $path -PathType Leaf) "path=$path"
}

$statusText = [System.IO.File]::ReadAllText($statusPath,[System.Text.Encoding]::UTF8)
$statusNeedle = "| 7 Equilibrium definition | $($ExpectedStatus -replace '_',' ') |"
Add-Check 'P07-STATE-PHASE6' $statusText.Contains('| 6 CMO equilibrium | APPROVED |') 'Phase 6 approved'
Add-Check 'P07-STATE-PHASE7' $statusText.Contains($statusNeedle) "expected=$statusNeedle"
Add-Check 'P07-STATE-PHASE8' $statusText.Contains('| 8 Six propositions + corollary | NOT STARTED |') 'Phase 8 not started'
Add-Check 'P07-GOVERNANCE' $statusText.Contains('EXEC-GOV-001') 'standing authorization'

$matrix = Import-Csv -LiteralPath $matrixPath
$expectedApproval = if ($ExpectedStatus -eq 'APPROVED') { 'YES' } else { 'NO' }
foreach ($id in @('P07-D01','P07-G01')) {
    $row = @($matrix | Where-Object requirement_id -eq $id)
    $rs = if ($row.Count -eq 1) { $row[0].current_status } else { 'BAD_ROW' }
    $ra = if ($row.Count -eq 1) { $row[0].approval_status } else { 'BAD_ROW' }
    Add-Check ('P07-MATRIX-' + $id) ($row.Count -eq 1 -and $rs -eq $ExpectedStatus -and $ra -eq $expectedApproval) "status=$rs approval=$ra"
}

$formalText = [System.IO.File]::ReadAllText($formalPath,[System.Text.Encoding]::UTF8)
$symbolsText = [System.IO.File]::ReadAllText($symbolsPath,[System.Text.Encoding]::UTF8)
$dependencyText = [System.IO.File]::ReadAllText($dependencyPath,[System.Text.Encoding]::UTF8)
$assumptionsText = [System.IO.File]::ReadAllText($assumptionsPath,[System.Text.Encoding]::UTF8)
$independentText = [System.IO.File]::ReadAllText($independentPath,[System.Text.Encoding]::UTF8)
$issuesText = [System.IO.File]::ReadAllText($issuesPath,[System.Text.Encoding]::UTF8)

$requiredLabels = @('eq:p07-equilibrium-collection','eq:p07-route-optimality','eq:p07-advancement-optimality','eq:p07-capacity-optimality','eq:p07-market-clearing')
foreach ($label in $requiredLabels) {
    Add-Check ('P07-LABEL-' + $label) $formalText.Contains("\label{$label}") "label=$label"
}
$equationLabels = @([regex]::Matches($formalText,'\\label\{(eq:p07-[^}]+)\}') | ForEach-Object { $_.Groups[1].Value })
Add-Check 'P07-EXACT-EQUATION-LABELS' ($equationLabels.Count -eq 5 -and @($equationLabels | Where-Object { $_ -notin $requiredLabels }).Count -eq 0) "labels=$($equationLabels -join ';')"
foreach ($needle in @(
    'p_m^*','x_i^*','r_i^*(q,m)','s_j^*','contains exactly these four',
    '\arg\max_{r\in\{I,E,T,A\}}','\Omega_i(M,p_m^*)','\arg\max_{s_j\geq0}',
    'D_m(p_m^*;M)=S_m(p_m^*)','not additional members','entry condition and no labor-market',
    'product-market aggregate','welfare-clearing condition'
)) {
    Add-Check ('P07-FORMAL-' + ($needle.GetHashCode().ToString('X8'))) $formalText.Contains($needle) "required=$needle"
}
foreach ($pattern in @('\\eta\b','\\frac\{\\exp\{','Type-I','inclusive\s+value','representative\s+household','capital\s+accumulation','\\max_\{e_j')) {
    $m = [regex]::Match($formalText,$pattern,[System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
    Add-Check ('P07-FORBID-' + ($pattern.GetHashCode().ToString('X8'))) (-not $m.Success) "pattern=$pattern match=$($m.Value)"
}
Add-Check 'P07-NO-NEW-SYMBOL' ($symbolsText.Contains('Phase 7 adds no symbol') -and $symbolsText.Contains('There are 66 active rows.')) 'symbol registry unchanged at 66 rows'
foreach ($n in 1..5) {
    $id = 'P07-E{0:D2}' -f $n
    Add-Check ('P07-DEPENDENCY-' + $id) $dependencyText.Contains($id) "required=$id"
}
Add-Check 'P07-NO-NEW-ASSUMPTION' ($assumptionsText.Contains('Phase 7 adds no primitive or regularity assumption') -and $assumptionsText.Contains('Phase 7 assumption-use matrix')) 'inheritance matrix recorded'
Add-Check 'P07-INDEPENDENT' ($independentText.Contains('Independent review conclusion: no P0 and no P1') -and $independentText.Contains('Object-count audit')) 'independent audit complete'
Add-Check 'P07-NO-P0' (-not $issuesText.Contains('Phase: Phase 7') -and -not ($issuesText -match 'Severity now:.*P0')) 'no Phase 7 P0'

$allTex = 1..7 | ForEach-Object {
    $tag = '{0:D2}' -f $_
    $file = Get-ChildItem -LiteralPath $modelRebuild -Filter "${tag}_*.tex" | Select-Object -First 1
    [System.IO.File]::ReadAllText($file.FullName,[System.Text.Encoding]::UTF8)
}
$labels = @([regex]::Matches(($allTex -join [Environment]::NewLine),'\\label\{([^}]+)\}') | ForEach-Object { $_.Groups[1].Value })
$duplicates = @($labels | Group-Object | Where-Object Count -gt 1 | ForEach-Object Name)
Add-Check 'P07-LABEL-UNIQUE' ($duplicates.Count -eq 0) "duplicates=$($duplicates -join ';')"

$logText = if (Test-Path -LiteralPath $latexLogPath) { [System.IO.File]::ReadAllText($latexLogPath,[System.Text.Encoding]::UTF8) } else { '' }
$fatal = @(@('! LaTeX Error:','Fatal error occurred','There were undefined references','multiply defined') | Where-Object { $logText.Contains($_) })
$boxes = @([regex]::Matches($logText,'(?m)^(Overfull|Underfull) \\[hv]box')).Count
Add-Check 'P07-LATEX-FATAL' ($fatal.Count -eq 0 -and $logText.Length -gt 0) "fatal=$($fatal -join ';')"
Add-Check 'P07-LATEX-BOXES' ($boxes -eq 0) "box_warnings=$boxes"

$allowed = @(
    'paper/model_notes/00_model_closure_status.md','paper/model_notes/01_symbols_and_objects.md',
    'paper/model_notes/02_equation_dependency_map.md','paper/model_notes/03_assumptions_and_scope.md',
    'paper/model_rebuild/.gitattributes','paper/model_rebuild/07_equilibrium_definition.tex',
    'paper/model_rebuild/audit/phase07_artifact_hashes.md','paper/model_rebuild/audit/phase07_audit_results.json',
    'paper/model_rebuild/audit/phase07_commit_manifest.txt','paper/model_rebuild/audit/phase07_compile_console.txt',
    'paper/model_rebuild/audit/phase07_compile_wrapper.tex','paper/model_rebuild/audit/phase07_gate_report.md',
    'paper/model_rebuild/audit/phase07_independent_definition_audit.md','paper/model_rebuild/audit/phase07_preflight.md',
    'paper/model_rebuild/scripts/audit_phase07.ps1','paper/model_rebuild/spec/approvals/phase07_standing_authorization.md',
    'paper/model_rebuild/spec/instruction_traceability_matrix.csv','paper/model_rebuild/spec/specification_hashes.md'
)
$allowedSet = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
foreach ($p in $allowed) { [void]$allowedSet.Add($p) }
$unexpected = [System.Collections.Generic.List[string]]::new()
foreach ($line in @(& git -C $repoRoot status --porcelain=v1 --untracked-files=all)) {
    if ([string]::IsNullOrWhiteSpace($line)) { continue }
    $path = $line.Substring(3).Replace('\','/')
    if ($path.Contains(' -> ')) { $path = ($path -split ' -> ')[-1] }
    if (-not $allowedSet.Contains($path)) { $unexpected.Add($path) }
}
Add-Check 'P07-SCOPE-EXACT' ($unexpected.Count -eq 0) "unexpected=$($unexpected -join ';')"

if ($ExpectedStatus -in @('READY_FOR_APPROVAL','APPROVED')) {
    $gateText = if (Test-Path -LiteralPath $gateReportPath) { [System.IO.File]::ReadAllText($gateReportPath,[System.Text.Encoding]::UTF8) } else { '' }
    $ids = @('RL-01','RL-28','P07-D01','P07-G01','QA-PROOF-01','QA-PROOF-05','QA-PROOF-07','QA-PROOF-09','QA-PROOF-10','QA-ECON-01','QA-ECON-05')
    $missing = @($ids | Where-Object { -not $gateText.Contains($_) })
    Add-Check 'P07-GATE-IDS' ($missing.Count -eq 0) "missing=$($missing -join ';')"
    Add-Check 'P07-GATE-RESULT' ($gateText.Contains('P0: 0') -and $gateText.Contains('Overall gate: PASS')) 'gate PASS'
}

$failed = @($checks | Where-Object { -not $_.passed })
$result = [ordered]@{
    phase=7; expected_status=$ExpectedStatus;
    status=if($failed.Count -eq 0){$ExpectedStatus}else{'AUDIT_FAILED'};
    generated_at=(Get-Date).ToString('o');
    passed=@($checks | Where-Object passed).Count; failed=$failed.Count; checks=$checks
}
[System.IO.File]::WriteAllText($jsonPath,($result | ConvertTo-Json -Depth 6)+[Environment]::NewLine,[System.Text.UTF8Encoding]::new($false))
Write-Output "SUMMARY status=$($result.status) passed=$($result.passed) failed=$($result.failed) report=$jsonPath"
foreach ($item in $failed) { Write-Output "FAIL $($item.id): $($item.evidence)" }
if ($failed.Count -gt 0) { exit 1 }
