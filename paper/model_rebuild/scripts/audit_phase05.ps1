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
$formalPath = Join-Path $modelRebuild '05_rd_problem.tex'
$statusPath = Join-Path $notesRoot '00_model_closure_status.md'
$symbolsPath = Join-Path $notesRoot '01_symbols_and_objects.md'
$dependencyPath = Join-Path $notesRoot '02_equation_dependency_map.md'
$assumptionsPath = Join-Path $notesRoot '03_assumptions_and_scope.md'
$propositionPath = Join-Path $notesRoot '04_proposition_checklist.md'
$issuesPath = Join-Path $notesRoot '06_open_issues_log.md'
$matrixPath = Join-Path $specRoot 'instruction_traceability_matrix.csv'
$gateReportPath = Join-Path $auditRoot 'phase05_gate_report.md'
$independentPath = Join-Path $auditRoot 'phase05_independent_derivation.md'
$latexLogPath = Join-Path $auditRoot 'build_phase05\phase05_compile_wrapper.log'
$pdfPath = Join-Path $auditRoot 'build_phase05\phase05_compile_wrapper.pdf'
$jsonPath = Join-Path $auditRoot 'phase05_audit_results.json'
$lockedBase = 'cd5b6e49608749e0bf32f3d9aa235a84f378347b'
$phaseFourCommit = 'b2e865f6a64807afbadc89bdec7b6edc659957fc'

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
    @('P05-HASH-BASE','MAH_model_rebuild_execution_note_for_Codex.md','F6C11377D71E4E25D40FFB8AC9FE2EA7AA051AD7E123BA7E3A32DBA895342B24'),
    @('P05-HASH-AMD11','MAH_model_rebuild_amendment_v1.1_for_Codex.md','D76856241E460D31087AB60690E85D5681806E53BD42991F725458727CCD1EA9'),
    @('P05-HASH-AMD12-IMAGE','MAH_model_rebuild_correction_v1.2.png','1C0035AB49A5FF5C207CB71C1E3F04CFAC4E333BEDDAB73841D2A72F603723E5'),
    @('P05-HASH-AMD12-TEXT','MAH_model_rebuild_correction_v1.2_transcription.md','06AF48B2D853EA82F7176505D2ACA4D0CBFE06E5DB52C18026308196FE85E48E')
)
foreach ($spec in $hashSpecs) { Test-Hash $spec[0] (Join-Path $sourceRoot $spec[1]) $spec[2] }
Test-Hash 'P05-HASH-EFFECTIVE' (Join-Path $specRoot 'MAH_model_rebuild_effective_spec_v1.2.md') '855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666'

$branch = (& git -C $repoRoot branch --show-current).Trim()
$head = (& git -C $repoRoot rev-parse HEAD).Trim()
$remoteTracking = (& git -C $repoRoot rev-parse origin/codex/mah-model-rebuild).Trim()
Add-Check 'P05-GIT-BRANCH' ($branch -eq 'codex/mah-model-rebuild') "branch=$branch"
Add-Check 'P05-GIT-ENTRY-COMMIT' ($head -eq $phaseFourCommit) "head=$head"
Add-Check 'P05-GIT-REMOTE-TRACKING' ($remoteTracking -eq $head) "remote=$remoteTracking"
$manuscriptDiff = @(& git -C $repoRoot diff --name-only $lockedBase -- paper/manuscript)
$zipStatus = @(& git -C $repoRoot status --porcelain=v1 -- paper/collaboration/MAH_model_update_20260717.zip)
Add-Check 'P05-MANUSCRIPT-READ-ONLY' ($manuscriptDiff.Count -eq 0) "changed=$($manuscriptDiff -join ';')"
Add-Check 'P05-ZIP-ISOLATED' ($zipStatus.Count -eq 0) "count=$($zipStatus.Count)"

$requiredFiles = @(
    $formalPath,
    (Join-Path $auditRoot 'phase05_preflight.md'),
    $independentPath,
    (Join-Path $auditRoot 'phase05_compile_wrapper.tex'),
    (Join-Path $auditRoot 'phase05_compile_console.txt'),
    $latexLogPath,
    $pdfPath,
    $symbolsPath,
    $dependencyPath,
    $assumptionsPath,
    $propositionPath
)
foreach ($path in $requiredFiles) {
    Add-Check ('P05-FILE-' + [System.IO.Path]::GetFileName($path)) (Test-Path -LiteralPath $path -PathType Leaf) "path=$path"
}

$statusText = [System.IO.File]::ReadAllText($statusPath, [System.Text.Encoding]::UTF8)
$statusNeedle = "| 5 Project advancement | $($ExpectedStatus -replace '_',' ') |"
Add-Check 'P05-STATE-PHASE4' $statusText.Contains('| 4 Routes/sorting | APPROVED |') 'Phase 4 approved'
Add-Check 'P05-STATE-PHASE5' $statusText.Contains($statusNeedle) "expected=$statusNeedle"
Add-Check 'P05-STATE-PHASE6' $statusText.Contains('| 6 CMO equilibrium | NOT STARTED |') 'Phase 6 not started'
Add-Check 'P05-GOVERNANCE' $statusText.Contains('EXEC-GOV-001') 'standing authorization present'

$matrix = Import-Csv -LiteralPath $matrixPath
$expectedApproval = if ($ExpectedStatus -eq 'APPROVED') { 'YES' } else { 'NO' }
foreach ($id in @('P05-D01','P05-G01')) {
    $row = @($matrix | Where-Object requirement_id -eq $id)
    $rowStatus = if ($row.Count -eq 1) { $row[0].current_status } else { 'MISSING_OR_DUPLICATE' }
    $rowApproval = if ($row.Count -eq 1) { $row[0].approval_status } else { 'MISSING_OR_DUPLICATE' }
    Add-Check ('P05-MATRIX-' + $id) ($row.Count -eq 1 -and $rowStatus -eq $ExpectedStatus -and $rowApproval -eq $expectedApproval) "status=$rowStatus approval=$rowApproval"
}

$formalText = [System.IO.File]::ReadAllText($formalPath, [System.Text.Encoding]::UTF8)
$symbolsText = [System.IO.File]::ReadAllText($symbolsPath, [System.Text.Encoding]::UTF8)
$dependencyText = [System.IO.File]::ReadAllText($dependencyPath, [System.Text.Encoding]::UTF8)
$assumptionsText = [System.IO.File]::ReadAllText($assumptionsPath, [System.Text.Encoding]::UTF8)
$propositionText = [System.IO.File]::ReadAllText($propositionPath, [System.Text.Encoding]::UTF8)
$independentText = [System.IO.File]::ReadAllText($independentPath, [System.Text.Encoding]::UTF8)
$issuesText = [System.IO.File]::ReadAllText($issuesPath, [System.Text.Encoding]::UTF8)

$requiredFormal = @(
    '\label{eq:p05-planned-intensity}',
    '\label{eq:p05-advancement-cost}',
    '\label{eq:p05-expected-value}',
    '\label{eq:p05-advancement-objective}',
    '\label{eq:p05-kkt}',
    '\label{eq:p05-foc}',
    '\label{eq:p05-soc}',
    '\label{eq:p05-optimal-advancement}',
    '\label{eq:p05-binary-channel}',
    '\label{eq:p05-value-gap}',
    '\label{eq:p05-value-gap-foc}',
    '\lambda_i^{\mathrm{plan}}=a_ix_i',
    'C_X(x_i)',
    '\frac{\kappa}{1+\nu}x_i^{1+\nu}',
    '\Omega_i(M,p_m)',
    '\mathbb E_F',
    '\max_{x_i\geq0}',
    '\kappa x_i^\nu-\beta a_i\Omega_i(M,p_m)\geq0',
    '-\kappa\nu x_i^{\nu-1}<0',
    '\frac{\beta a_i}{\kappa}',
    '\Omega_i(1,p_m)-\Omega_i(0,p_m)',
    '\frac{\partial x_i^*}{\partial\Omega_i}',
    'K_i-B_i=\Omega_i',
    'C_X''(x_i)',
    'MAH affects',
    'only through \(\Omega_i\)',
    'fixed-price result',
    'not a derivative with respect to \(M\)'
)
foreach ($needle in $requiredFormal) {
    Add-Check ('P05-FORMAL-' + ($needle.GetHashCode().ToString('X8'))) $formalText.Contains($needle) "required=$needle"
}

$forbiddenPatterns = @(
    '(?i)\blogit\b',
    '(?i)inclusive\s+value',
    '\\eta\b',
    'x_i\^R',
    'x_i\^D',
    'x_\{i,\s*g\}',
    '\\Omega_\{ig\}',
    'C_R',
    '\\frac\{\\partial[^}]*\}\{\\partial M\}',
    'D_m\(',
    'S_m\(',
    's_j\^',
    '(?i)representative\s+household',
    '(?i)\bentry\b',
    '(?i)\bwelfare\b',
    '(?i)portfolio\s+dynamics'
)
foreach ($pattern in $forbiddenPatterns) {
    $match = [regex]::Match($formalText, $pattern)
    Add-Check ('P05-FORBID-' + ($pattern.GetHashCode().ToString('X8'))) (-not $match.Success) "pattern=$pattern match=$($match.Value)"
}

$xigMatches = @([regex]::Matches($formalText, 'x_\{ig\}')).Count
Add-Check 'P05-XIG-NEGATIVE-BOUNDARY' ($xigMatches -eq 1 -and $formalText.Contains('There is no class-specific control \(x_{ig}\).')) "occurrences=$xigMatches"
Add-Check 'P05-V12-CANONICAL-X' ($formalText.Contains('original-drug innovation investment / project-advancement intensity') -and $formalText.Contains('broader than pure clinical-development effort')) 'v1.2 definition'
Add-Check 'P05-NO-PATENT-IMPLICATION' ($formalText.Contains('it is not patent') -and -not ($formalText -match '(?i)(MAH|reform).{0,40}(increase|raise).{0,30}patent')) 'patent boundary only'
Add-Check 'P05-NO-FINANCE-BLOCK' ($formalText.Contains('no binding financial constraint') -and -not ($formalText -match '(?i)(budget|borrowing|liquidity)\s+(constraint|limit)')) 'financial constraint excluded'
Add-Check 'P05-COMMON-CONTROL' ($formalText.Contains('one common control') -and $formalText.Contains('no novelty-class-specific control')) 'single x_i'
Add-Check 'P05-COST-UNIFIED' ($formalText.Contains('one cost function \(C_X\)') -and -not $formalText.Contains('C_R')) 'C_X only'
Add-Check 'P05-OMEGA-NONNEGATIVE' ($formalText.Contains('W_i(q,m;M,p_m)\geq0') -and $formalText.Contains('0\leq\Omega_i(M,p_m)<+\infty')) 'abandonment bound'
Add-Check 'P05-KKT-CORNER' ($formalText.Contains('If \(\Omega_i=0\), the formula gives the unique corner \(x_i^*=0\).') -and $formalText.Contains('If \(\Omega_i>0\), the solution is interior.')) 'corner/interior split'
Add-Check 'P05-CONCAVITY-EXISTENCE' ($formalText.Contains('strictly concave') -and $formalText.Contains('superlinear cost dominates') -and $formalText.Contains('unique maximizer exists')) 'global optimizer'
Add-Check 'P05-NU-ONE' ($formalText.Contains('boundary \(\nu=1\) gives a quadratic') -and $formalText.Contains('advancement cost.')) 'mandatory nu=1 boundary'
Add-Check 'P05-DIMENSIONS' ($formalText.Contains('\(\mathsf C/\mathsf X^{1+\nu}\)') -and $formalText.Contains('has units \(\mathsf X^\nu\)')) 'cost and optimizer units'
Add-Check 'P05-STRICT-CONDITION' ($formalText.Contains('positive-probability set') -and $formalText.Contains('zero reform effect')) 'strict and zero-effect cases'
Add-Check 'P05-FIXED-VS-EQUILIBRIUM' ($formalText.Contains('fixed-price result') -and $formalText.Contains('not the equilibrium-price comparative static')) 'price boundary'
Add-Check 'P05-ONLY-OMEGA-CHANNEL' ($formalText.Contains('MAH affects') -and $formalText.Contains('\(x_i^*\) only through \(\Omega_i\)')) 'only expected value channel'
Add-Check 'P05-K-ROLE' ($formalText.Contains('Manufacturing capability \(k_i\) affects') -and $formalText.Contains('not through') -and $formalText.Contains('\(a_ix_i\) or \(C_X(x_i)\)')) 'manufacturing capability boundary'
Add-Check 'P05-GAP-NONRECURSIVE' ($formalText.Contains('not recursive state variables') -and $formalText.Contains('downstream project-value interpretation')) 'appendix value gap only'

Add-Check 'P05-SYMBOL-ACTIVE-COUNT' $symbolsText.Contains('There are 58 active rows.') '58 active objects'
foreach ($needle in @('| $\kappa$ | primitive parameter |','| $\nu$ | primitive parameter |','| $C_X(x_i)$ | primitive parameter |','| $x_i^*(M,p_m)$ | endogenous firm-level object |','| $B_i$ | endogenous firm-level object |','| $K_i$ | endogenous firm-level object |')) {
    Add-Check ('P05-SYMBOL-' + ($needle.GetHashCode().ToString('X8'))) $symbolsText.Contains($needle) "required=$needle"
}
foreach ($id in @('A-P05-COST-01','A-P05-VALUE-01','A-P05-TIME-01','A-P05-CHANNEL-01','A-P05-GAP-01')) {
    Add-Check ('P05-ASSUMPTION-' + $id) $assumptionsText.Contains($id) "required=$id"
}
foreach ($number in 1..9) {
    $id = 'P05-E{0:D2}' -f $number
    Add-Check ('P05-DEPENDENCY-' + $id) $dependencyText.Contains($id) "required=$id"
}
Add-Check 'P05-DEPENDENCY-FEEDBACK-DEFERRED' ($dependencyText.Contains('feedback that selects') -and $dependencyText.Contains('remain deferred to Phase 6')) 'CMO feedback open'
Add-Check 'P05-PROPOSITION-SCOPE' ($propositionText.Contains('Draft P5-ADV') -and $propositionText.Contains('final proposition numbering') -and $propositionText.Contains('reserved for Phase 8')) 'Phase 8 finalization deferred'
Add-Check 'P05-PROPOSITION-ZERO-EFFECT' $propositionText.Contains('Zero-effect case:') 'zero case listed'
Add-Check 'P05-INDEPENDENT-REVIEW' ($independentText.Contains('Independent review conclusion: no P0 and no P1') -and $independentText.Contains('Result: PASS for SOC, global optimization')) 'independent review complete'
Add-Check 'P05-OPEN-ISSUES-NO-CURRENT-P0' (-not $issuesText.Contains('Phase: Phase 5') -and -not ($issuesText -match 'Severity now:.*P0')) 'no Phase 5 P0'

$allTex = @(
    [System.IO.File]::ReadAllText((Join-Path $modelRebuild '01_primitives_and_timing.tex'), [System.Text.Encoding]::UTF8),
    [System.IO.File]::ReadAllText((Join-Path $modelRebuild '02_demand_profit_derivation.tex'), [System.Text.Encoding]::UTF8),
    [System.IO.File]::ReadAllText((Join-Path $modelRebuild '03_internal_external_technologies.tex'), [System.Text.Encoding]::UTF8),
    [System.IO.File]::ReadAllText((Join-Path $modelRebuild '04_route_values_and_sorting.tex'), [System.Text.Encoding]::UTF8),
    $formalText
) -join [Environment]::NewLine
$labels = @([regex]::Matches($allTex, '\\label\{([^}]+)\}') | ForEach-Object { $_.Groups[1].Value })
$duplicates = @($labels | Group-Object | Where-Object Count -gt 1 | ForEach-Object Name)
Add-Check 'P05-LABEL-UNIQUE' ($duplicates.Count -eq 0) "duplicates=$($duplicates -join ';')"

$logText = if (Test-Path -LiteralPath $latexLogPath) { [System.IO.File]::ReadAllText($latexLogPath, [System.Text.Encoding]::UTF8) } else { '' }
$fatal = @(@('! LaTeX Error:', 'Fatal error occurred', 'There were undefined references', 'multiply defined') | Where-Object { $logText.Contains($_) })
$boxes = @([regex]::Matches($logText, '(?m)^(Overfull|Underfull) \\[hv]box')).Count
Add-Check 'P05-LATEX-FATAL' ($fatal.Count -eq 0 -and $logText.Length -gt 0) "fatal=$($fatal -join ';')"
Add-Check 'P05-LATEX-BOXES' ($boxes -eq 0) "box_warnings=$boxes"

$controlFiles = @($formalPath,$symbolsPath,$dependencyPath,$assumptionsPath,$propositionPath,$independentPath)
$badControl = [System.Collections.Generic.List[string]]::new()
foreach ($path in $controlFiles) {
    $textValue = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)
    $bad = @($textValue.ToCharArray() | Where-Object { ([int]$_ -lt 32 -and $_ -notin @([char]13,[char]10,[char]9)) -or [int]$_ -eq 0xFFFD })
    if ($bad.Count -gt 0) { $badControl.Add($path) }
}
Add-Check 'P05-UTF8-CONTROL' ($badControl.Count -eq 0) "bad=$($badControl -join ';')"

$allowedExact = @(
    'paper/model_notes/00_model_closure_status.md',
    'paper/model_notes/01_symbols_and_objects.md',
    'paper/model_notes/02_equation_dependency_map.md',
    'paper/model_notes/03_assumptions_and_scope.md',
    'paper/model_notes/04_proposition_checklist.md',
    'paper/model_rebuild/.gitattributes',
    'paper/model_rebuild/05_rd_problem.tex',
    'paper/model_rebuild/audit/phase05_artifact_hashes.md',
    'paper/model_rebuild/audit/phase05_audit_results.json',
    'paper/model_rebuild/audit/phase05_commit_manifest.txt',
    'paper/model_rebuild/audit/phase05_compile_console.txt',
    'paper/model_rebuild/audit/phase05_compile_wrapper.tex',
    'paper/model_rebuild/audit/phase05_gate_report.md',
    'paper/model_rebuild/audit/phase05_independent_derivation.md',
    'paper/model_rebuild/audit/phase05_preflight.md',
    'paper/model_rebuild/scripts/audit_phase05.ps1',
    'paper/model_rebuild/spec/approvals/phase05_standing_authorization.md',
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
Add-Check 'P05-SCOPE-EXACT' ($unexpected.Count -eq 0) "unexpected=$($unexpected -join ';')"

if ($ExpectedStatus -in @('READY_FOR_APPROVAL','APPROVED')) {
    $gateText = if (Test-Path -LiteralPath $gateReportPath) { [System.IO.File]::ReadAllText($gateReportPath, [System.Text.Encoding]::UTF8) } else { '' }
    $requiredGateIds = @('RL-01','RL-28','AMD11-F','AMD11-G','AMD12-01','P05-D01','P05-G01','QA-PROOF-01','QA-PROOF-02','QA-PROOF-03','QA-PROOF-04','QA-PROOF-05','QA-PROOF-06','QA-PROOF-07','QA-PROOF-08','QA-PROOF-10','QA-ECON-01','QA-ECON-02','QA-ECON-04','QA-ECON-05')
    $missing = @($requiredGateIds | Where-Object { -not $gateText.Contains($_) })
    Add-Check 'P05-GATE-REPORT-IDS' ($missing.Count -eq 0) "missing=$($missing -join ';')"
    Add-Check 'P05-GATE-REPORT-RESULT' ($gateText.Contains('P0: 0') -and $gateText.Contains('Overall gate: PASS')) 'gate PASS and zero P0'
}

$failed = @($checks | Where-Object { -not $_.passed })
$result = [ordered]@{
    phase = 5
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
