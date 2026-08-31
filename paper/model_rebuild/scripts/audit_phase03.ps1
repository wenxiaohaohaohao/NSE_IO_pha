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
$formalPath = Join-Path $modelRebuild '03_internal_external_technologies.tex'
$statusPath = Join-Path $notesRoot '00_model_closure_status.md'
$symbolsPath = Join-Path $notesRoot '01_symbols_and_objects.md'
$dependencyPath = Join-Path $notesRoot '02_equation_dependency_map.md'
$assumptionsPath = Join-Path $notesRoot '03_assumptions_and_scope.md'
$issuesPath = Join-Path $notesRoot '06_open_issues_log.md'
$matrixPath = Join-Path $specRoot 'instruction_traceability_matrix.csv'
$gateReportPath = Join-Path $auditRoot 'phase03_gate_report.md'
$latexLogPath = Join-Path $auditRoot 'build_phase03\phase03_compile_wrapper.log'
$pdfPath = Join-Path $auditRoot 'build_phase03\phase03_compile_wrapper.pdf'
$jsonPath = Join-Path $auditRoot 'phase03_audit_results.json'
$lockedBase = 'cd5b6e49608749e0bf32f3d9aa235a84f378347b'
$phaseTwoCommit = 'cb7e5f544caf640205eb7d7ec994da39cb47b259'

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
    @('P03-HASH-BASE','MAH_model_rebuild_execution_note_for_Codex.md','F6C11377D71E4E25D40FFB8AC9FE2EA7AA051AD7E123BA7E3A32DBA895342B24'),
    @('P03-HASH-AMD11','MAH_model_rebuild_amendment_v1.1_for_Codex.md','D76856241E460D31087AB60690E85D5681806E53BD42991F725458727CCD1EA9'),
    @('P03-HASH-AMD12-IMAGE','MAH_model_rebuild_correction_v1.2.png','1C0035AB49A5FF5C207CB71C1E3F04CFAC4E333BEDDAB73841D2A72F603723E5'),
    @('P03-HASH-AMD12-TEXT','MAH_model_rebuild_correction_v1.2_transcription.md','06AF48B2D853EA82F7176505D2ACA4D0CBFE06E5DB52C18026308196FE85E48E')
)
foreach ($spec in $hashSpecs) { Test-Hash $spec[0] (Join-Path $sourceRoot $spec[1]) $spec[2] }
Test-Hash 'P03-HASH-EFFECTIVE' (Join-Path $specRoot 'MAH_model_rebuild_effective_spec_v1.2.md') '855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666'

$branch = (& git -C $repoRoot branch --show-current).Trim()
$head = (& git -C $repoRoot rev-parse HEAD).Trim()
$remoteTracking = (& git -C $repoRoot rev-parse origin/codex/mah-model-rebuild).Trim()
Add-Check 'P03-GIT-BRANCH' ($branch -eq 'codex/mah-model-rebuild') "branch=$branch"
Add-Check 'P03-GIT-ENTRY-COMMIT' ($head -eq $phaseTwoCommit) "head=$head"
Add-Check 'P03-GIT-REMOTE-TRACKING' ($remoteTracking -eq $head) "remote=$remoteTracking"
$manuscriptDiff = @(& git -C $repoRoot diff --name-only $lockedBase -- paper/manuscript)
$zipStatus = @(& git -C $repoRoot status --porcelain=v1 -- paper/collaboration/MAH_model_update_20260717.zip)
Add-Check 'P03-MANUSCRIPT-READ-ONLY' ($manuscriptDiff.Count -eq 0) "changed=$($manuscriptDiff -join ';')"
Add-Check 'P03-ZIP-ISOLATED' ($zipStatus.Count -eq 0) "count=$($zipStatus.Count)"

$requiredFiles = @(
    $formalPath,
    (Join-Path $auditRoot 'phase03_preflight.md'),
    (Join-Path $auditRoot 'phase03_independent_technology_audit.md'),
    (Join-Path $auditRoot 'phase03_compile_wrapper.tex'),
    (Join-Path $auditRoot 'phase03_compile_console.txt'),
    $latexLogPath,
    $pdfPath,
    $symbolsPath,
    $dependencyPath,
    $assumptionsPath
)
foreach ($path in $requiredFiles) {
    Add-Check ('P03-FILE-' + [System.IO.Path]::GetFileName($path)) (Test-Path -LiteralPath $path -PathType Leaf) "path=$path"
}

$statusText = [System.IO.File]::ReadAllText($statusPath, [System.Text.Encoding]::UTF8)
$statusNeedle = "| 3 Technologies | $($ExpectedStatus -replace '_',' ') |"
Add-Check 'P03-STATE-PHASE2' $statusText.Contains('| 2 Demand/profit | APPROVED |') 'Phase 2 approved'
Add-Check 'P03-STATE-PHASE3' $statusText.Contains($statusNeedle) "expected=$statusNeedle"
Add-Check 'P03-STATE-PHASE4' $statusText.Contains('| 4 Routes/sorting | NOT STARTED |') 'Phase 4 not started'
Add-Check 'P03-GOVERNANCE' $statusText.Contains('EXEC-GOV-001') 'standing authorization present'

$matrix = Import-Csv -LiteralPath $matrixPath
$expectedApproval = if ($ExpectedStatus -eq 'APPROVED') { 'YES' } else { 'NO' }
foreach ($id in @('P03-D01','P03-G01')) {
    $row = @($matrix | Where-Object requirement_id -eq $id)
    Add-Check ('P03-MATRIX-' + $id) ($row.Count -eq 1 -and $row[0].current_status -eq $ExpectedStatus -and $row[0].approval_status -eq $expectedApproval) "status=$($row[0].current_status) approval=$($row[0].approval_status)"
}

$formalText = [System.IO.File]::ReadAllText($formalPath, [System.Text.Encoding]::UTF8)
$symbolsText = [System.IO.File]::ReadAllText($symbolsPath, [System.Text.Encoding]::UTF8)
$dependencyText = [System.IO.File]::ReadAllText($dependencyPath, [System.Text.Encoding]::UTF8)
$assumptionsText = [System.IO.File]::ReadAllText($assumptionsPath, [System.Text.Encoding]::UTF8)
$issuesText = [System.IO.File]::ReadAllText($issuesPath, [System.Text.Encoding]::UTF8)

$requiredFormal = @(
    '\label{eq:p03-internal-cost}',
    '\label{eq:p03-internal-setup}',
    '\label{eq:p03-external-cost}',
    '\label{eq:p03-capacity-requirement}',
    '\label{eq:p03-external-fixed-cost}',
    '\label{eq:p03-holder-burden}',
    '\label{eq:p03-policy-invariance}',
    '\label{tab:p03-local-crosswalk}',
    'F_I(m,k_i)=+\infty',
    'c_{I,m}(m,k_i)>0',
    'c_{I,k}(m,k_i)<0',
    'F_{I,m}(m,k_i)>0',
    'F_{I,k}(m,k_i)<0',
    'b''(m)>0',
    'developer remains the authorization holder',
    'not eliminated by MAH',
    'does not construct those values',
    'monetary capacity payment \(p_m b(m)\)'
)
foreach ($needle in $requiredFormal) {
    Add-Check ('P03-FORMAL-' + ($needle.GetHashCode().ToString('X8'))) $formalText.Contains($needle) "required=$needle"
}

$forbiddenPatterns = @(
    '(?i)\blogit\b',
    '(?i)inclusive\s+value',
    '(?i)representative\s+household',
    '(?i)\bwelfare\b',
    '(?i)portfolio\s+dynamics',
    'x_\{ig\}',
    'W_i\^[IE]',
    '\\max_\{r',
    'D_m\(',
    'S_m\(',
    '\\frac\{\\partial[^}]*\}\{\\partial M\}'
)
foreach ($pattern in $forbiddenPatterns) {
    $match = [regex]::Match($formalText, $pattern)
    Add-Check ('P03-FORBID-' + ($pattern.GetHashCode().ToString('X8'))) (-not $match.Success) "pattern=$pattern match=$($match.Value)"
}
$etaMatches = @([regex]::Matches($formalText, '\\eta\b')).Count
Add-Check 'P03-ETA-REMOVAL-ONLY' ($etaMatches -eq 1 -and $formalText.Contains('Remove from the baseline; it has no Phase~3 replacement.')) "occurrences=$etaMatches"
Add-Check 'P03-NO-BINARY-FEASIBILITY-OBJECT' ($formalText.Contains('No separate binary internal-feasibility') -and $formalText.Contains('primitive is')) 'infinity convention used'
Add-Check 'P03-NO-ROUTE-VALUE-ASSEMBLY' (-not $formalText.Contains('W_i^I') -and -not $formalText.Contains('W_i^E')) 'no route-value equations'
Add-Check 'P03-NO-CMO-CLEARING' $formalText.Contains('does not posit a fall in \(p_m^*\)') 'CMO clearing deferred'

Add-Check 'P03-SYMBOL-ACTIVE-COUNT' $symbolsText.Contains('There are 44 active rows.') '44 active objects'
foreach ($needle in @('| $c_I(m,k_i)$ | primitive parameter |','| $F_I(m,k_i)$ | primitive parameter |','| $\underline{k}(m)$ | primitive parameter |','| $c_E(m)$ | primitive parameter |','| $b(m)$ | primitive parameter |','| $F_E(m)$ | primitive parameter |','| $\mu_E$ | primitive parameter |')) {
    Add-Check ('P03-SYMBOL-' + ($needle.GetHashCode().ToString('X8'))) $symbolsText.Contains($needle) "required=$needle"
}
foreach ($id in @('A-P03-INT-01','A-P03-INT-02','A-P03-EXT-01','A-P03-EXT-02','A-P03-HOLDER-01','A-P03-POLICY-01','A-P03-SCARCITY-01')) {
    Add-Check ('P03-ASSUMPTION-' + $id) $assumptionsText.Contains($id) "required=$id"
}
foreach ($number in 1..7) {
    $id = 'P03-E{0:D2}' -f $number
    Add-Check ('P03-DEPENDENCY-' + $id) $dependencyText.Contains($id) "required=$id"
}
Add-Check 'P03-OPEN-ISSUES-NO-CURRENT-P0' (-not $issuesText.Contains('Phase: Phase 3') -and -not ($issuesText -match 'Severity now:.*P0')) 'no Phase 3 P0'

$allTex = @(
    [System.IO.File]::ReadAllText((Join-Path $modelRebuild '01_primitives_and_timing.tex'), [System.Text.Encoding]::UTF8),
    [System.IO.File]::ReadAllText((Join-Path $modelRebuild '02_demand_profit_derivation.tex'), [System.Text.Encoding]::UTF8),
    $formalText
) -join [Environment]::NewLine
$labels = @([regex]::Matches($allTex, '\\label\{([^}]+)\}') | ForEach-Object { $_.Groups[1].Value })
$duplicates = @($labels | Group-Object | Where-Object Count -gt 1 | ForEach-Object Name)
Add-Check 'P03-LABEL-UNIQUE' ($duplicates.Count -eq 0) "duplicates=$($duplicates -join ';')"

$logText = if (Test-Path -LiteralPath $latexLogPath) { [System.IO.File]::ReadAllText($latexLogPath, [System.Text.Encoding]::UTF8) } else { '' }
$fatal = @(@('! LaTeX Error:', 'Fatal error occurred', 'There were undefined references', 'multiply defined') | Where-Object { $logText.Contains($_) })
$boxes = @([regex]::Matches($logText, '(?m)^(Overfull|Underfull) \\[hv]box')).Count
Add-Check 'P03-LATEX-FATAL' ($fatal.Count -eq 0 -and $logText.Length -gt 0) "fatal=$($fatal -join ';')"
Add-Check 'P03-LATEX-BOXES' ($boxes -eq 0) "box_warnings=$boxes"

$controlFiles = @($formalPath,$symbolsPath,$dependencyPath,$assumptionsPath,(Join-Path $auditRoot 'phase03_independent_technology_audit.md'))
$badControl = [System.Collections.Generic.List[string]]::new()
foreach ($path in $controlFiles) {
    $textValue = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)
    $bad = @($textValue.ToCharArray() | Where-Object { ([int]$_ -lt 32 -and $_ -notin @([char]13,[char]10,[char]9)) -or [int]$_ -eq 0xFFFD })
    if ($bad.Count -gt 0) { $badControl.Add($path) }
}
Add-Check 'P03-UTF8-CONTROL' ($badControl.Count -eq 0) "bad=$($badControl -join ';')"

$allowedExact = @(
    'paper/model_notes/00_model_closure_status.md',
    'paper/model_notes/01_symbols_and_objects.md',
    'paper/model_notes/02_equation_dependency_map.md',
    'paper/model_notes/03_assumptions_and_scope.md',
    'paper/model_rebuild/.gitattributes',
    'paper/model_rebuild/03_internal_external_technologies.tex',
    'paper/model_rebuild/audit/phase03_artifact_hashes.md',
    'paper/model_rebuild/audit/phase03_audit_results.json',
    'paper/model_rebuild/audit/phase03_commit_manifest.txt',
    'paper/model_rebuild/audit/phase03_compile_console.txt',
    'paper/model_rebuild/audit/phase03_compile_wrapper.tex',
    'paper/model_rebuild/audit/phase03_gate_report.md',
    'paper/model_rebuild/audit/phase03_independent_technology_audit.md',
    'paper/model_rebuild/audit/phase03_preflight.md',
    'paper/model_rebuild/scripts/audit_phase03.ps1',
    'paper/model_rebuild/spec/approvals/phase03_standing_authorization.md',
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
Add-Check 'P03-SCOPE-EXACT' ($unexpected.Count -eq 0) "unexpected=$($unexpected -join ';')"

if ($ExpectedStatus -in @('READY_FOR_APPROVAL','APPROVED')) {
    $gateText = if (Test-Path -LiteralPath $gateReportPath) { [System.IO.File]::ReadAllText($gateReportPath, [System.Text.Encoding]::UTF8) } else { '' }
    $requiredGateIds = @('RL-01','RL-28','P03-D01','P03-G01','QA-PROOF-03','QA-PROOF-04','QA-PROOF-08','QA-PROOF-10','QA-ECON-01','QA-ECON-03','QA-ECON-04','QA-ECON-05')
    $missing = @($requiredGateIds | Where-Object { -not $gateText.Contains($_) })
    Add-Check 'P03-GATE-REPORT-IDS' ($missing.Count -eq 0) "missing=$($missing -join ';')"
    Add-Check 'P03-GATE-REPORT-RESULT' ($gateText.Contains('P0: 0') -and $gateText.Contains('Overall gate: PASS')) 'gate PASS and zero P0'
}

$failed = @($checks | Where-Object { -not $_.passed })
$result = [ordered]@{
    phase = 3
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
