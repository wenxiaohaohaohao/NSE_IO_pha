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
$formalPath = Join-Path $modelRebuild '06_cmo_supply_demand_equilibrium.tex'
$statusPath = Join-Path $notesRoot '00_model_closure_status.md'
$symbolsPath = Join-Path $notesRoot '01_symbols_and_objects.md'
$dependencyPath = Join-Path $notesRoot '02_equation_dependency_map.md'
$assumptionsPath = Join-Path $notesRoot '03_assumptions_and_scope.md'
$propositionPath = Join-Path $notesRoot '04_proposition_checklist.md'
$issuesPath = Join-Path $notesRoot '06_open_issues_log.md'
$matrixPath = Join-Path $specRoot 'instruction_traceability_matrix.csv'
$gateReportPath = Join-Path $auditRoot 'phase06_gate_report.md'
$independentPath = Join-Path $auditRoot 'phase06_independent_equilibrium_audit.md'
$latexLogPath = Join-Path $auditRoot 'build_phase06\phase06_compile_wrapper.log'
$pdfPath = Join-Path $auditRoot 'build_phase06\phase06_compile_wrapper.pdf'
$jsonPath = Join-Path $auditRoot 'phase06_audit_results.json'
$lockedBase = 'cd5b6e49608749e0bf32f3d9aa235a84f378347b'
$entryCommit = '152ad60a38064935f8d08483c1fa90c33647d072'

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
    @('P06-HASH-BASE','MAH_model_rebuild_execution_note_for_Codex.md','F6C11377D71E4E25D40FFB8AC9FE2EA7AA051AD7E123BA7E3A32DBA895342B24'),
    @('P06-HASH-AMD11','MAH_model_rebuild_amendment_v1.1_for_Codex.md','D76856241E460D31087AB60690E85D5681806E53BD42991F725458727CCD1EA9'),
    @('P06-HASH-AMD12-IMAGE','MAH_model_rebuild_correction_v1.2.png','1C0035AB49A5FF5C207CB71C1E3F04CFAC4E333BEDDAB73841D2A72F603723E5'),
    @('P06-HASH-AMD12-TEXT','MAH_model_rebuild_correction_v1.2_transcription.md','06AF48B2D853EA82F7176505D2ACA4D0CBFE06E5DB52C18026308196FE85E48E')
)) { Test-Hash $spec[0] (Join-Path $sourceRoot $spec[1]) $spec[2] }
Test-Hash 'P06-HASH-EFFECTIVE' (Join-Path $specRoot 'MAH_model_rebuild_effective_spec_v1.2.md') '855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666'

$branch = (& git -C $repoRoot branch --show-current).Trim()
$head = (& git -C $repoRoot rev-parse HEAD).Trim()
$remote = (& git -C $repoRoot rev-parse origin/codex/mah-model-rebuild).Trim()
Add-Check 'P06-GIT-BRANCH' ($branch -eq 'codex/mah-model-rebuild') "branch=$branch"
Add-Check 'P06-GIT-ENTRY' ($head -eq $entryCommit) "head=$head"
Add-Check 'P06-GIT-REMOTE' ($remote -eq $head) "remote=$remote"
$manuscriptDiff = @(& git -C $repoRoot diff --name-only $lockedBase -- paper/manuscript)
$zipStatus = @(& git -C $repoRoot status --porcelain=v1 -- paper/collaboration/MAH_model_update_20260717.zip)
Add-Check 'P06-MANUSCRIPT-READ-ONLY' ($manuscriptDiff.Count -eq 0) "changed=$($manuscriptDiff -join ';')"
Add-Check 'P06-ZIP-ISOLATED' ($zipStatus.Count -eq 0) "count=$($zipStatus.Count)"

foreach ($path in @(
    $formalPath,
    (Join-Path $auditRoot 'phase06_preflight.md'),
    $independentPath,
    (Join-Path $auditRoot 'phase06_compile_wrapper.tex'),
    (Join-Path $auditRoot 'phase06_compile_console.txt'),
    $latexLogPath,$pdfPath,$symbolsPath,$dependencyPath,$assumptionsPath,$propositionPath
)) {
    Add-Check ('P06-FILE-' + [System.IO.Path]::GetFileName($path)) (Test-Path -LiteralPath $path -PathType Leaf) "path=$path"
}

$statusText = [System.IO.File]::ReadAllText($statusPath,[System.Text.Encoding]::UTF8)
$statusNeedle = "| 6 CMO equilibrium | $($ExpectedStatus -replace '_',' ') |"
Add-Check 'P06-STATE-PHASE5' $statusText.Contains('| 5 Project advancement | APPROVED |') 'Phase 5 approved'
Add-Check 'P06-STATE-PHASE6' $statusText.Contains($statusNeedle) "expected=$statusNeedle"
Add-Check 'P06-STATE-PHASE7' $statusText.Contains('| 7 Equilibrium definition | NOT STARTED |') 'Phase 7 not started'
Add-Check 'P06-GOVERNANCE' $statusText.Contains('EXEC-GOV-001') 'standing authorization'

$matrix = Import-Csv -LiteralPath $matrixPath
$expectedApproval = if ($ExpectedStatus -eq 'APPROVED') { 'YES' } else { 'NO' }
foreach ($id in @('P06-D01','P06-G01')) {
    $row = @($matrix | Where-Object requirement_id -eq $id)
    $rs = if ($row.Count -eq 1) { $row[0].current_status } else { 'BAD_ROW' }
    $ra = if ($row.Count -eq 1) { $row[0].approval_status } else { 'BAD_ROW' }
    Add-Check ('P06-MATRIX-' + $id) ($row.Count -eq 1 -and $rs -eq $ExpectedStatus -and $ra -eq $expectedApproval) "status=$rs approval=$ra"
}

$formalText = [System.IO.File]::ReadAllText($formalPath,[System.Text.Encoding]::UTF8)
$symbolsText = [System.IO.File]::ReadAllText($symbolsPath,[System.Text.Encoding]::UTF8)
$dependencyText = [System.IO.File]::ReadAllText($dependencyPath,[System.Text.Encoding]::UTF8)
$assumptionsText = [System.IO.File]::ReadAllText($assumptionsPath,[System.Text.Encoding]::UTF8)
$propositionText = [System.IO.File]::ReadAllText($propositionPath,[System.Text.Encoding]::UTF8)
$independentText = [System.IO.File]::ReadAllText($independentPath,[System.Text.Encoding]::UTF8)
$issuesText = [System.IO.File]::ReadAllText($issuesPath,[System.Text.Encoding]::UTF8)

$requiredLabels = @(
    'eq:p06-supplier-problem','eq:p06-supplier-capacity',
    'eq:p06-capacity-derivatives','eq:p06-aggregate-supply',
    'eq:p06-entrusted-capacity','eq:p06-omega-price-envelope',
    'eq:p06-advancement-price-response','eq:p06-study-demand',
    'eq:p06-total-demand','eq:p06-market-clearing',
    'eq:p06-existence-boundaries'
)
foreach ($label in $requiredLabels) {
    Add-Check ('P06-LABEL-' + $label) $formalText.Contains("\label{$label}") "label=$label"
}
foreach ($needle in @(
    '\max_{s_j\geq0}','p_ms_j-\Psi(s_j;z_j)',
    'p_m=\Psi_s','\frac{1}{\Psi_{ss}}>0',
    '-\frac{\Psi_{sz}}{\Psi_{ss}}>0',
    'S_m(p_m)','\chi_i^E(p_m;M)',
    '\mathbf 1','r_i^*(q,m;M,p_m)=E',
    '\frac{\partial\Omega_i(M,p_m)}{\partial p_m}',
    '\frac{\partial x_i^*(M,p_m)}{\partial p_m}',
    'D_m^{\mathrm{MAH}}(p_m;M)',
    'a_ix_i^*(M,p_m)\chi_i^E(p_m;M)',
    'D_m^B(p_m)','D_m(p_m;M)',
    'D_m(p_m^*;M)=S_m(p_m^*)',
    'strictly increasing','weakly decreasing',
    'Dominated convergence','zero-measure tie set',
    'one scalar equation in \(p_m\)',
    'D_m^{\mathrm{MAH}}(p_m;0)=0',
    'endogenous','not a direct policy shift'
)) {
    Add-Check ('P06-FORMAL-' + ($needle.GetHashCode().ToString('X8'))) $formalText.Contains($needle) "required=$needle"
}

foreach ($pattern in @(
    '\\eta\b','x_\{ig\}','\\Omega_\{ig\}',
    '\\frac\{\\exp\{','Type-I','inclusive\s+value',
    'representative\s+household','capital\s+accumulation',
    '\\max_\{e_j','firm\s+entry\s+condition'
)) {
    $m = [regex]::Match($formalText,$pattern,[System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
    Add-Check ('P06-FORBID-' + ($pattern.GetHashCode().ToString('X8'))) (-not $m.Success) "pattern=$pattern match=$($m.Value)"
}
Add-Check 'P06-SUPPLY-OPTIMIZED' ($formalText.Contains('The objective''s second derivative is') -and $formalText.Contains('capacity choice is unique')) 'supplier FOC/SOC'
Add-Check 'P06-NO-DIRECT-SUPPLY-SHIFT' ($formalText.Contains('Supply technology and') -and $formalText.Contains('invariant to \(M\)') -and $formalText.Contains('no direct supply shift')) 'policy-invariant supply'
Add-Check 'P06-BOTH-DEMAND-FEEDBACKS' ($formalText.Contains('both price feedbacks required') -and $formalText.Contains('expected project value') -and $formalText.Contains('deterministic route selection')) 'advancement and route'
Add-Check 'P06-DETERMINISTIC-REGULARITY' ($formalText.Contains('not a probabilistic') -and $formalText.Contains('continuous heterogeneity') -and $formalText.Contains('not smooth random utility')) 'no logit smoothing'
Add-Check 'P06-EXISTENCE' ($formalText.Contains('at least one') -and $formalText.Contains('positive clearing price')) 'boundary plus IVT'
Add-Check 'P06-UNIQUENESS' ($formalText.Contains('difference is strictly decreasing') -and $formalText.Contains('clearing price') -and $formalText.Contains('is unique')) 'monotone crossing'
Add-Check 'P06-CYCLE-CLOSED' ($formalText.Contains('without an unresolved') -and $formalText.Contains('find the unique zero')) 'scalar solution order'
Add-Check 'P06-PRE-MAH-BACKGROUND' ($formalText.Contains('background demand still supports the market') -and $formalText.Contains('D_m^{\mathrm{MAH}}(p_m;0)=0')) 'M=0 boundary'
Add-Check 'P06-PRICE-INTERPRETATION' ($formalText.Contains('weakly above the pre-MAH price') -and $formalText.Contains('not a direct policy shift')) 'endogenous price response'
Add-Check 'P06-ONE-MARKET' ($formalText.Contains('closes qualified manufacturing-service capacity only') -and $formalText.Contains('no additional market-clearing condition')) 'single market'

Add-Check 'P06-SYMBOL-COUNT' $symbolsText.Contains('There are 66 active rows.') '66 active rows'
foreach ($needle in @('| $s_j$ | control |','| $\Psi(s_j;z_j)$ | primitive parameter |','| $s_j^*(p_m,z_j)$ | endogenous firm-level object |','| $\chi_i^E(p_m;M)$ | endogenous firm-level object |','| $S_m(p_m)$ | endogenous firm-level object |','| $D_m^{\mathrm{MAH}}(p_m;M)$ | endogenous firm-level object |','| $D_m^B(p_m)$ | aggregate/distributional primitive |','| $D_m(p_m;M)$ | endogenous firm-level object |')) {
    Add-Check ('P06-SYMBOL-' + ($needle.GetHashCode().ToString('X8'))) $symbolsText.Contains($needle) "required=$needle"
}
foreach ($id in @('A-P06-SUPPLY-01','A-P06-BACKGROUND-01','A-P06-AGG-01','A-P06-PRICE-01')) {
    Add-Check ('P06-ASSUMPTION-' + $id) $assumptionsText.Contains($id) "required=$id"
}
foreach ($n in 1..11) {
    $id = 'P06-E{0:D2}' -f $n
    Add-Check ('P06-DEPENDENCY-' + $id) $dependencyText.Contains($id) "required=$id"
}
Add-Check 'P06-DEPENDENCY-CLOSED' ($dependencyText.Contains('[CLOSED: Phase 6]') -and $dependencyText.Contains('scalar market-clearing equation')) 'fixed point closed'
Add-Check 'P06-PROPOSITION-DRAFT' ($propositionText.Contains('Draft P6-CMO') -and $propositionText.Contains('reserved for Phase 8')) 'Phase 8 finalization deferred'
Add-Check 'P06-INDEPENDENT' ($independentText.Contains('Independent review conclusion: no P0 and no P1') -and $independentText.Contains('Result: PASS for sufficient existence and uniqueness')) 'independent audit'
Add-Check 'P06-NO-P0' (-not $issuesText.Contains('Phase: Phase 6') -and -not ($issuesText -match 'Severity now:.*P0')) 'no Phase 6 P0'

$allTex = @('01_primitives_and_timing.tex','02_demand_profit_derivation.tex','03_internal_external_technologies.tex','04_route_values_and_sorting.tex','05_rd_problem.tex','06_cmo_supply_demand_equilibrium.tex') | ForEach-Object {
    [System.IO.File]::ReadAllText((Join-Path $modelRebuild $_),[System.Text.Encoding]::UTF8)
}
$labels = @([regex]::Matches(($allTex -join [Environment]::NewLine),'\\label\{([^}]+)\}') | ForEach-Object { $_.Groups[1].Value })
$duplicates = @($labels | Group-Object | Where-Object Count -gt 1 | ForEach-Object Name)
Add-Check 'P06-LABEL-UNIQUE' ($duplicates.Count -eq 0) "duplicates=$($duplicates -join ';')"

$logText = if (Test-Path -LiteralPath $latexLogPath) { [System.IO.File]::ReadAllText($latexLogPath,[System.Text.Encoding]::UTF8) } else { '' }
$fatal = @(@('! LaTeX Error:','Fatal error occurred','There were undefined references','multiply defined') | Where-Object { $logText.Contains($_) })
$boxes = @([regex]::Matches($logText,'(?m)^(Overfull|Underfull) \\[hv]box')).Count
Add-Check 'P06-LATEX-FATAL' ($fatal.Count -eq 0 -and $logText.Length -gt 0) "fatal=$($fatal -join ';')"
Add-Check 'P06-LATEX-BOXES' ($boxes -eq 0) "box_warnings=$boxes"

$badControl = [System.Collections.Generic.List[string]]::new()
foreach ($path in @($formalPath,$symbolsPath,$dependencyPath,$assumptionsPath,$propositionPath,$independentPath)) {
    $tv = [System.IO.File]::ReadAllText($path,[System.Text.Encoding]::UTF8)
    $bad = @($tv.ToCharArray() | Where-Object { ([int]$_ -lt 32 -and $_ -notin @([char]13,[char]10,[char]9)) -or [int]$_ -eq 0xFFFD })
    if ($bad.Count -gt 0) { $badControl.Add($path) }
}
Add-Check 'P06-UTF8-CONTROL' ($badControl.Count -eq 0) "bad=$($badControl -join ';')"

$allowed = @(
    'paper/model_notes/00_model_closure_status.md','paper/model_notes/01_symbols_and_objects.md',
    'paper/model_notes/02_equation_dependency_map.md','paper/model_notes/03_assumptions_and_scope.md',
    'paper/model_notes/04_proposition_checklist.md','paper/model_rebuild/.gitattributes',
    'paper/model_rebuild/06_cmo_supply_demand_equilibrium.tex',
    'paper/model_rebuild/audit/phase06_artifact_hashes.md','paper/model_rebuild/audit/phase06_audit_results.json',
    'paper/model_rebuild/audit/phase06_commit_manifest.txt','paper/model_rebuild/audit/phase06_compile_console.txt',
    'paper/model_rebuild/audit/phase06_compile_wrapper.tex','paper/model_rebuild/audit/phase06_gate_report.md',
    'paper/model_rebuild/audit/phase06_independent_equilibrium_audit.md','paper/model_rebuild/audit/phase06_preflight.md',
    'paper/model_rebuild/scripts/audit_phase06.ps1','paper/model_rebuild/spec/approvals/phase06_standing_authorization.md',
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
Add-Check 'P06-SCOPE-EXACT' ($unexpected.Count -eq 0) "unexpected=$($unexpected -join ';')"

if ($ExpectedStatus -in @('READY_FOR_APPROVAL','APPROVED')) {
    $gateText = if (Test-Path -LiteralPath $gateReportPath) { [System.IO.File]::ReadAllText($gateReportPath,[System.Text.Encoding]::UTF8) } else { '' }
    $ids = @('RL-01','RL-28','P06-D01','P06-G01','QA-PROOF-01','QA-PROOF-02','QA-PROOF-03','QA-PROOF-04','QA-PROOF-05','QA-PROOF-06','QA-PROOF-07','QA-PROOF-08','QA-PROOF-09','QA-PROOF-10','QA-ECON-01','QA-ECON-04','QA-ECON-05')
    $missing = @($ids | Where-Object { -not $gateText.Contains($_) })
    Add-Check 'P06-GATE-IDS' ($missing.Count -eq 0) "missing=$($missing -join ';')"
    Add-Check 'P06-GATE-RESULT' ($gateText.Contains('P0: 0') -and $gateText.Contains('Overall gate: PASS')) 'gate PASS'
}

$failed = @($checks | Where-Object { -not $_.passed })
$result = [ordered]@{
    phase=6; expected_status=$ExpectedStatus;
    status=if($failed.Count -eq 0){$ExpectedStatus}else{'AUDIT_FAILED'};
    generated_at=(Get-Date).ToString('o');
    passed=@($checks | Where-Object passed).Count; failed=$failed.Count; checks=$checks
}
[System.IO.File]::WriteAllText($jsonPath,($result | ConvertTo-Json -Depth 6)+[Environment]::NewLine,[System.Text.UTF8Encoding]::new($false))
Write-Output "SUMMARY status=$($result.status) passed=$($result.passed) failed=$($result.failed) report=$jsonPath"
foreach ($item in $failed) { Write-Output "FAIL $($item.id): $($item.evidence)" }
if ($failed.Count -gt 0) { exit 1 }
