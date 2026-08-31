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
$formalPath = Join-Path $modelRebuild '04_route_values_and_sorting.tex'
$statusPath = Join-Path $notesRoot '00_model_closure_status.md'
$symbolsPath = Join-Path $notesRoot '01_symbols_and_objects.md'
$dependencyPath = Join-Path $notesRoot '02_equation_dependency_map.md'
$assumptionsPath = Join-Path $notesRoot '03_assumptions_and_scope.md'
$propositionPath = Join-Path $notesRoot '04_proposition_checklist.md'
$issuesPath = Join-Path $notesRoot '06_open_issues_log.md'
$matrixPath = Join-Path $specRoot 'instruction_traceability_matrix.csv'
$gateReportPath = Join-Path $auditRoot 'phase04_gate_report.md'
$independentPath = Join-Path $auditRoot 'phase04_independent_derivation.md'
$latexLogPath = Join-Path $auditRoot 'build_phase04\phase04_compile_wrapper.log'
$pdfPath = Join-Path $auditRoot 'build_phase04\phase04_compile_wrapper.pdf'
$jsonPath = Join-Path $auditRoot 'phase04_audit_results.json'
$lockedBase = 'cd5b6e49608749e0bf32f3d9aa235a84f378347b'
$phaseThreeCommit = '06984a993323de3bac6e63e921cd1dc9842f1672'

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

$hashSpecs = @(
    @('P04-HASH-BASE','MAH_model_rebuild_execution_note_for_Codex.md','F6C11377D71E4E25D40FFB8AC9FE2EA7AA051AD7E123BA7E3A32DBA895342B24'),
    @('P04-HASH-AMD11','MAH_model_rebuild_amendment_v1.1_for_Codex.md','D76856241E460D31087AB60690E85D5681806E53BD42991F725458727CCD1EA9'),
    @('P04-HASH-AMD12-IMAGE','MAH_model_rebuild_correction_v1.2.png','1C0035AB49A5FF5C207CB71C1E3F04CFAC4E333BEDDAB73841D2A72F603723E5'),
    @('P04-HASH-AMD12-TEXT','MAH_model_rebuild_correction_v1.2_transcription.md','06AF48B2D853EA82F7176505D2ACA4D0CBFE06E5DB52C18026308196FE85E48E')
)
foreach ($spec in $hashSpecs) { Test-Hash $spec[0] (Join-Path $sourceRoot $spec[1]) $spec[2] }
Test-Hash 'P04-HASH-EFFECTIVE' (Join-Path $specRoot 'MAH_model_rebuild_effective_spec_v1.2.md') '855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666'

$branch = (& git -C $repoRoot branch --show-current).Trim()
$head = (& git -C $repoRoot rev-parse HEAD).Trim()
$remoteTracking = (& git -C $repoRoot rev-parse origin/codex/mah-model-rebuild).Trim()
Add-Check 'P04-GIT-BRANCH' ($branch -eq 'codex/mah-model-rebuild') "branch=$branch"
Add-Check 'P04-GIT-ENTRY-COMMIT' ($head -eq $phaseThreeCommit) "head=$head"
Add-Check 'P04-GIT-REMOTE-TRACKING' ($remoteTracking -eq $head) "remote=$remoteTracking"
$manuscriptDiff = @(& git -C $repoRoot diff --name-only $lockedBase -- paper/manuscript)
$zipStatus = @(& git -C $repoRoot status --porcelain=v1 -- paper/collaboration/MAH_model_update_20260717.zip)
Add-Check 'P04-MANUSCRIPT-READ-ONLY' ($manuscriptDiff.Count -eq 0) "changed=$($manuscriptDiff -join ';')"
Add-Check 'P04-ZIP-ISOLATED' ($zipStatus.Count -eq 0) "count=$($zipStatus.Count)"

$requiredFiles = @(
    $formalPath,
    (Join-Path $auditRoot 'phase04_preflight.md'),
    $independentPath,
    (Join-Path $auditRoot 'phase04_compile_wrapper.tex'),
    (Join-Path $auditRoot 'phase04_compile_console.txt'),
    $latexLogPath,
    $pdfPath,
    $symbolsPath,
    $dependencyPath,
    $assumptionsPath,
    $propositionPath
)
foreach ($path in $requiredFiles) {
    Add-Check ('P04-FILE-' + [System.IO.Path]::GetFileName($path)) (Test-Path -LiteralPath $path -PathType Leaf) "path=$path"
}

$statusText = [System.IO.File]::ReadAllText($statusPath, [System.Text.Encoding]::UTF8)
$statusNeedle = "| 4 Routes/sorting | $($ExpectedStatus -replace '_',' ') |"
Add-Check 'P04-STATE-PHASE3' $statusText.Contains('| 3 Technologies | APPROVED |') 'Phase 3 approved'
Add-Check 'P04-STATE-PHASE4' $statusText.Contains($statusNeedle) "expected=$statusNeedle"
Add-Check 'P04-STATE-PHASE5' $statusText.Contains('| 5 Project advancement | NOT STARTED |') 'Phase 5 not started'
Add-Check 'P04-GOVERNANCE' $statusText.Contains('EXEC-GOV-001') 'standing authorization present'

$matrix = Import-Csv -LiteralPath $matrixPath
$expectedApproval = if ($ExpectedStatus -eq 'APPROVED') { 'YES' } else { 'NO' }
foreach ($id in @('P04-D01','P04-G01')) {
    $row = @($matrix | Where-Object requirement_id -eq $id)
    $rowStatus = if ($row.Count -eq 1) { $row[0].current_status } else { 'MISSING_OR_DUPLICATE' }
    $rowApproval = if ($row.Count -eq 1) { $row[0].approval_status } else { 'MISSING_OR_DUPLICATE' }
    Add-Check ('P04-MATRIX-' + $id) ($row.Count -eq 1 -and $rowStatus -eq $ExpectedStatus -and $rowApproval -eq $expectedApproval) "status=$rowStatus approval=$rowApproval"
}

$formalText = [System.IO.File]::ReadAllText($formalPath, [System.Text.Encoding]::UTF8)
$symbolsText = [System.IO.File]::ReadAllText($symbolsPath, [System.Text.Encoding]::UTF8)
$dependencyText = [System.IO.File]::ReadAllText($dependencyPath, [System.Text.Encoding]::UTF8)
$assumptionsText = [System.IO.File]::ReadAllText($assumptionsPath, [System.Text.Encoding]::UTF8)
$propositionText = [System.IO.File]::ReadAllText($propositionPath, [System.Text.Encoding]::UTF8)
$independentText = [System.IO.File]::ReadAllText($independentPath, [System.Text.Encoding]::UTF8)
$issuesText = [System.IO.File]::ReadAllText($issuesPath, [System.Text.Encoding]::UTF8)

$requiredFormal = @(
    '\label{eq:p04-internal-value}',
    '\label{eq:p04-entrusted-value}',
    '\label{eq:p04-outside-values}',
    '\label{eq:p04-optimized-value}',
    '\label{eq:p04-route-choice}',
    '\label{eq:p04-binary-value-effect}',
    '\label{eq:p04-value-gap}',
    '\label{eq:p04-gap-slope}',
    '\label{eq:p04-cutoff}',
    '\label{eq:p04-cutoff-sorting}',
    '\label{eq:p04-cutoff-derivatives}',
    'W_i^I(q,m)',
    'W_i^E(q,m;M,p_m)',
    'W^T(q,m)=T(q,m)',
    'W^A=0',
    '\max\left\{',
    '\arg\max_{r\in\{I,E,T,A\}}',
    '\tau_E(0)=+\infty',
    '\frac{\partial\Delta_{IE}}{\partial k_i}',
    's(q)R_c\!\left(q,c_I(m,k_i)\right)c_{I,k}(m,k_i)',
    '-\frac{1}{\Delta_{IE,k}(k^*)}<0',
    '-\frac{b(m)}{\Delta_{IE,k}(k^*)}<0',
    'fixed-price',
    'not an equilibrium derivative through \(p_m^*\)',
    'If \(T\) or \(A\) dominates'
)
foreach ($needle in $requiredFormal) {
    Add-Check ('P04-FORMAL-' + ($needle.GetHashCode().ToString('X8'))) $formalText.Contains($needle) "required=$needle"
}

$forbiddenPatterns = @(
    '(?i)\blogit\b',
    '(?i)inclusive\s+value',
    '\\eta\b',
    'B_i\(',
    'W_i\^r',
    'x_\{ig\}',
    '\\frac\{\\partial[^}]*\}\{\\partial M\}',
    'D_m\(',
    'S_m\(',
    '(?i)representative\s+household',
    '(?i)\bentry\b',
    '(?i)\bwelfare\b',
    '(?i)portfolio\s+dynamics'
)
foreach ($pattern in $forbiddenPatterns) {
    $match = [regex]::Match($formalText, $pattern)
    Add-Check ('P04-FORBID-' + ($pattern.GetHashCode().ToString('X8'))) (-not $match.Success) "pattern=$pattern match=$($match.Value)"
}
Add-Check 'P04-HOLDER-RIGHTS' $formalText.Contains('developer remains the authorization holder under \(E\)') 'retained authorization explicit'
Add-Check 'P04-COST-ONCE' ($formalText.Contains('Each route cost is subtracted exactly once.') -and $formalText.Contains('\(p_m b(m)\) is not contained in \(c_E(m)\)')) 'unique accounting'
Add-Check 'P04-DETERMINISTIC' ($formalText.Contains('deterministic comparison') -and $formalText.Contains('measure-zero event')) 'deterministic route choice'
Add-Check 'P04-OUTSIDE-CONDITIONAL' ($formalText.Contains('Conditional on both \(I\) and \(E\) dominating transfer and abandonment') -and $formalText.Contains('does not determine the') -and $formalText.Contains('realized route.')) 'T/A retained'
Add-Check 'P04-ZERO-EFFECT' ($formalText.Contains('The gain is exactly zero') -and $formalText.Contains('zero project-value and route-choice')) 'zero effect admitted'
Add-Check 'P04-NO-GENERIC-UNDECLARED-PAYOFF' (-not $formalText.Contains('W_i^r')) 'four values listed explicitly'

Add-Check 'P04-SYMBOL-ACTIVE-COUNT' $symbolsText.Contains('There are 52 active rows.') '52 active objects'
foreach ($needle in @('| $T(q,m)$ | primitive parameter |','| $W_i^I(q,m)$ | endogenous route-level object |','| $W_i^E(q,m;M,p_m)$ | endogenous route-level object |','| $W^T(q,m)$ | endogenous route-level object |','| $W^A$ | endogenous route-level object |','| $W_i(q,m;M,p_m)$ | endogenous route-level object |','| $\Delta_{IE}(k_i;q,m,M,p_m)$ | endogenous route-level object |','| $k^*(q,m;p_m,M)$ | endogenous route-level object |')) {
    Add-Check ('P04-SYMBOL-' + ($needle.GetHashCode().ToString('X8'))) $symbolsText.Contains($needle) "required=$needle"
}
foreach ($id in @('A-P04-OUTSIDE-01','A-P04-CHOICE-01','A-P04-CUTOFF-01','A-P04-CUTOFF-02','A-P04-PRICE-01','A-P04-POLICY-01')) {
    Add-Check ('P04-ASSUMPTION-' + $id) $assumptionsText.Contains($id) "required=$id"
}
foreach ($number in 1..9) {
    $id = 'P04-E{0:D2}' -f $number
    Add-Check ('P04-DEPENDENCY-' + $id) $dependencyText.Contains($id) "required=$id"
}
Add-Check 'P04-PROPOSITION-SCOPE' ($propositionText.Contains('Draft P4-ORG') -and $propositionText.Contains('final proposition numbering and proof audit are reserved for Phase 8')) 'Phase 8 finalization deferred'
Add-Check 'P04-PROPOSITION-ZERO-EFFECT' $propositionText.Contains('Zero-effect cases:') 'zero cases listed'
Add-Check 'P04-INDEPENDENT-REVIEW' ($independentText.Contains('Independent review conclusion: no P0 and no P1') -and $independentText.Contains('Result: PASS for the implicit derivatives')) 'independent review complete'
Add-Check 'P04-OPEN-ISSUES-NO-CURRENT-P0' (-not $issuesText.Contains('Phase: Phase 4') -and -not ($issuesText -match 'Severity now:.*P0')) 'no Phase 4 P0'

$allTex = @(
    [System.IO.File]::ReadAllText((Join-Path $modelRebuild '01_primitives_and_timing.tex'), [System.Text.Encoding]::UTF8),
    [System.IO.File]::ReadAllText((Join-Path $modelRebuild '02_demand_profit_derivation.tex'), [System.Text.Encoding]::UTF8),
    [System.IO.File]::ReadAllText((Join-Path $modelRebuild '03_internal_external_technologies.tex'), [System.Text.Encoding]::UTF8),
    $formalText
) -join [Environment]::NewLine
$labels = @([regex]::Matches($allTex, '\\label\{([^}]+)\}') | ForEach-Object { $_.Groups[1].Value })
$duplicates = @($labels | Group-Object | Where-Object Count -gt 1 | ForEach-Object Name)
Add-Check 'P04-LABEL-UNIQUE' ($duplicates.Count -eq 0) "duplicates=$($duplicates -join ';')"

$logText = if (Test-Path -LiteralPath $latexLogPath) { [System.IO.File]::ReadAllText($latexLogPath, [System.Text.Encoding]::UTF8) } else { '' }
$fatal = @(@('! LaTeX Error:', 'Fatal error occurred', 'There were undefined references', 'multiply defined') | Where-Object { $logText.Contains($_) })
$boxes = @([regex]::Matches($logText, '(?m)^(Overfull|Underfull) \\[hv]box')).Count
Add-Check 'P04-LATEX-FATAL' ($fatal.Count -eq 0 -and $logText.Length -gt 0) "fatal=$($fatal -join ';')"
Add-Check 'P04-LATEX-BOXES' ($boxes -eq 0) "box_warnings=$boxes"

$controlFiles = @($formalPath,$symbolsPath,$dependencyPath,$assumptionsPath,$propositionPath,$independentPath)
$badControl = [System.Collections.Generic.List[string]]::new()
foreach ($path in $controlFiles) {
    $textValue = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)
    $bad = @($textValue.ToCharArray() | Where-Object { ([int]$_ -lt 32 -and $_ -notin @([char]13,[char]10,[char]9)) -or [int]$_ -eq 0xFFFD })
    if ($bad.Count -gt 0) { $badControl.Add($path) }
}
Add-Check 'P04-UTF8-CONTROL' ($badControl.Count -eq 0) "bad=$($badControl -join ';')"

$allowedExact = @(
    'paper/model_notes/00_model_closure_status.md',
    'paper/model_notes/01_symbols_and_objects.md',
    'paper/model_notes/02_equation_dependency_map.md',
    'paper/model_notes/03_assumptions_and_scope.md',
    'paper/model_notes/04_proposition_checklist.md',
    'paper/model_rebuild/.gitattributes',
    'paper/model_rebuild/04_route_values_and_sorting.tex',
    'paper/model_rebuild/audit/phase04_artifact_hashes.md',
    'paper/model_rebuild/audit/phase04_audit_results.json',
    'paper/model_rebuild/audit/phase04_commit_manifest.txt',
    'paper/model_rebuild/audit/phase04_compile_console.txt',
    'paper/model_rebuild/audit/phase04_compile_wrapper.tex',
    'paper/model_rebuild/audit/phase04_gate_report.md',
    'paper/model_rebuild/audit/phase04_independent_derivation.md',
    'paper/model_rebuild/audit/phase04_preflight.md',
    'paper/model_rebuild/scripts/audit_phase04.ps1',
    'paper/model_rebuild/spec/approvals/phase04_standing_authorization.md',
    'paper/model_rebuild/spec/instruction_traceability_matrix.csv',
    'paper/model_rebuild/spec/specification_hashes.md'
)
$allowedSet = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
foreach ($path in $allowedExact) { [void]$allowedSet.Add($path) }
$unexpected = [System.Collections.Generic.List[string]]::new()
foreach ($line in @(& git -C $repoRoot status --porcelain=v1 --untracked-files=all)) {
    if ([string]::IsNullOrWhiteSpace($line)) { continue }
    $path = $line.Substring(3).Replace('\','/')
    if ($path.Contains(' -> ')) { $path = ($path -split ' -> ')[-1] }
    if (-not $allowedSet.Contains($path)) { $unexpected.Add($path) }
}
Add-Check 'P04-SCOPE-EXACT' ($unexpected.Count -eq 0) "unexpected=$($unexpected -join ';')"

if ($ExpectedStatus -in @('READY_FOR_APPROVAL','APPROVED')) {
    $gateText = if (Test-Path -LiteralPath $gateReportPath) { [System.IO.File]::ReadAllText($gateReportPath, [System.Text.Encoding]::UTF8) } else { '' }
    $requiredGateIds = @('RL-01','RL-28','P04-D01','P04-G01','QA-PROOF-03','QA-PROOF-04','QA-PROOF-05','QA-PROOF-06','QA-PROOF-07','QA-PROOF-08','QA-PROOF-10','QA-ECON-01','QA-ECON-03','QA-ECON-04','QA-ECON-05')
    $missing = @($requiredGateIds | Where-Object { -not $gateText.Contains($_) })
    Add-Check 'P04-GATE-REPORT-IDS' ($missing.Count -eq 0) "missing=$($missing -join ';')"
    Add-Check 'P04-GATE-REPORT-RESULT' ($gateText.Contains('P0: 0') -and $gateText.Contains('Overall gate: PASS')) 'gate PASS and zero P0'
}

$failed = @($checks | Where-Object { -not $_.passed })
$result = [ordered]@{
    phase = 4
    expected_status = $ExpectedStatus
    status = if ($failed.Count -eq 0) { $ExpectedStatus } else { 'AUDIT_FAILED' }
    generated_at = (Get-Date).ToString('o')
    passed = @($checks | Where-Object passed).Count
    failed = $failed.Count
    checks = $checks
}
$json = $result | ConvertTo-Json -Depth 6
[System.IO.File]::WriteAllText($jsonPath, $json + [Environment]::NewLine, [System.Text.UTF8Encoding]::new($false))
Write-Output "SUMMARY status=$($result.status) passed=$($result.passed) failed=$($result.failed) report=$jsonPath"
foreach ($item in $failed) { Write-Output "FAIL $($item.id): $($item.evidence)" }
if ($failed.Count -gt 0) { exit 1 }
