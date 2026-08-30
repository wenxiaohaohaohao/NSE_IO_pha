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
$formalPath = Join-Path $modelRebuild '02_demand_profit_derivation.tex'
$statusPath = Join-Path $notesRoot '00_model_closure_status.md'
$symbolsPath = Join-Path $notesRoot '01_symbols_and_objects.md'
$dependencyPath = Join-Path $notesRoot '02_equation_dependency_map.md'
$assumptionsPath = Join-Path $notesRoot '03_assumptions_and_scope.md'
$issuesPath = Join-Path $notesRoot '06_open_issues_log.md'
$matrixPath = Join-Path $specRoot 'instruction_traceability_matrix.csv'
$gateReportPath = Join-Path $auditRoot 'phase02_gate_report.md'
$compileConsolePath = Join-Path $auditRoot 'phase02_compile_console.txt'
$latexLogPath = Join-Path $auditRoot 'build_phase02\phase02_compile_wrapper.log'
$pdfPath = Join-Path $auditRoot 'build_phase02\phase02_compile_wrapper.pdf'
$jsonPath = Join-Path $auditRoot 'phase02_audit_results.json'
$lockedBase = 'cd5b6e49608749e0bf32f3d9aa235a84f378347b'
$phaseOneCommit = '7c7dad4fc2cee7325180f624a32c6f245d319aec'

$checks = [System.Collections.Generic.List[object]]::new()
function Add-Check {
    param([string]$Id, [bool]$Passed, [string]$Evidence)
    $checks.Add([pscustomobject]@{ id = $Id; passed = $Passed; evidence = $Evidence })
}
function Test-Hash {
    param([string]$Id, [string]$Path, [string]$Expected)
    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
        Add-Check $Id $false "missing=$Path"
        return
    }
    $actual = (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash
    Add-Check $Id ($actual -eq $Expected) "expected=$Expected actual=$actual"
}

Test-Hash 'P02-HASH-BASE' (Join-Path $sourceRoot 'MAH_model_rebuild_execution_note_for_Codex.md') 'F6C11377D71E4E25D40FFB8AC9FE2EA7AA051AD7E123BA7E3A32DBA895342B24'
Test-Hash 'P02-HASH-AMD11' (Join-Path $sourceRoot 'MAH_model_rebuild_amendment_v1.1_for_Codex.md') 'D76856241E460D31087AB60690E85D5681806E53BD42991F725458727CCD1EA9'
Test-Hash 'P02-HASH-AMD12-IMAGE' (Join-Path $sourceRoot 'MAH_model_rebuild_correction_v1.2.png') '1C0035AB49A5FF5C207CB71C1E3F04CFAC4E333BEDDAB73841D2A72F603723E5'
Test-Hash 'P02-HASH-AMD12-TEXT' (Join-Path $sourceRoot 'MAH_model_rebuild_correction_v1.2_transcription.md') '06AF48B2D853EA82F7176505D2ACA4D0CBFE06E5DB52C18026308196FE85E48E'
Test-Hash 'P02-HASH-EFFECTIVE' (Join-Path $specRoot 'MAH_model_rebuild_effective_spec_v1.2.md') '855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666'

$branch = (& git -C $repoRoot branch --show-current).Trim()
$head = (& git -C $repoRoot rev-parse HEAD).Trim()
$remoteTracking = (& git -C $repoRoot rev-parse origin/codex/mah-model-rebuild).Trim()
Add-Check 'P02-GIT-BRANCH' ($branch -eq 'codex/mah-model-rebuild') "branch=$branch"
Add-Check 'P02-GIT-ENTRY-COMMIT' ($head -eq $phaseOneCommit) "expected=$phaseOneCommit actual=$head"
Add-Check 'P02-GIT-REMOTE-TRACKING' ($remoteTracking -eq $head) "head=$head remote_tracking=$remoteTracking"

$manuscriptDiff = @(& git -C $repoRoot diff --name-only $lockedBase -- paper/manuscript)
Add-Check 'P02-MANUSCRIPT-READ-ONLY' ($manuscriptDiff.Count -eq 0) "changed=$($manuscriptDiff -join ';')"
$zipStatus = @(& git -C $repoRoot status --porcelain=v1 -- paper/collaboration/MAH_model_update_20260717.zip)
Add-Check 'P02-ZIP-ISOLATED' ($zipStatus.Count -eq 0) "target-worktree zip status count=$($zipStatus.Count)"

$requiredFiles = @(
    $formalPath,
    (Join-Path $auditRoot 'phase02_preflight.md'),
    (Join-Path $auditRoot 'phase02_independent_derivation.md'),
    (Join-Path $auditRoot 'phase02_compile_wrapper.tex'),
    $compileConsolePath,
    $latexLogPath,
    $pdfPath,
    $symbolsPath,
    $dependencyPath,
    $assumptionsPath
)
foreach ($path in $requiredFiles) {
    Add-Check ('P02-FILE-' + [System.IO.Path]::GetFileName($path)) (Test-Path -LiteralPath $path -PathType Leaf) "path=$path"
}

$statusText = [System.IO.File]::ReadAllText($statusPath, [System.Text.Encoding]::UTF8)
$statusNeedle = "| 2 Demand/profit | $($ExpectedStatus -replace '_',' ') |"
Add-Check 'P02-STATE-PHASE1' $statusText.Contains('| 1 Objects/timing | APPROVED |') 'Phase 1 remains approved'
Add-Check 'P02-STATE-PHASE2' $statusText.Contains($statusNeedle) "expected_row_fragment=$statusNeedle"
Add-Check 'P02-STATE-PHASE3' $statusText.Contains('| 3 Technologies | NOT STARTED |') 'Phase 3 remains NOT STARTED'
Add-Check 'P02-GOVERNANCE' $statusText.Contains('EXEC-GOV-001') 'standing zero-P0 authorization recorded'

$matrix = Import-Csv -LiteralPath $matrixPath
$p02d = @($matrix | Where-Object { $_.requirement_id -eq 'P02-D01' })
$p02g = @($matrix | Where-Object { $_.requirement_id -eq 'P02-G01' })
$expectedApproval = if ($ExpectedStatus -eq 'APPROVED') { 'YES' } else { 'NO' }
Add-Check 'P02-MATRIX-D01' ($p02d.Count -eq 1 -and $p02d[0].current_status -eq $ExpectedStatus -and $p02d[0].approval_status -eq $expectedApproval) "status=$($p02d[0].current_status) approval=$($p02d[0].approval_status)"
Add-Check 'P02-MATRIX-G01' ($p02g.Count -eq 1 -and $p02g[0].current_status -eq $ExpectedStatus -and $p02g[0].approval_status -eq $expectedApproval) "status=$($p02g[0].current_status) approval=$($p02g[0].approval_status)"

$formalText = [System.IO.File]::ReadAllText($formalPath, [System.Text.Encoding]::UTF8)
$symbolsText = [System.IO.File]::ReadAllText($symbolsPath, [System.Text.Encoding]::UTF8)
$dependencyText = [System.IO.File]::ReadAllText($dependencyPath, [System.Text.Encoding]::UTF8)
$assumptionsText = [System.IO.File]::ReadAllText($assumptionsPath, [System.Text.Encoding]::UTF8)
$issuesText = [System.IO.File]::ReadAllText($issuesPath, [System.Text.Encoding]::UTF8)

$requiredFormal = @(
    '\label{eq:p02-demand}',
    '\label{eq:p02-pricing-problem}',
    '\label{eq:p02-price-foc}',
    '\label{eq:p02-optimal-price}',
    '\label{eq:p02-price-soc}',
    '\label{eq:p02-operating-profit}',
    '\label{eq:p02-profit-derivatives}',
    '\label{eq:p02-present-value}',
    '\label{eq:p02-return-derivatives}',
    'p^*(c)=\frac{\varepsilon}{\varepsilon-1}c',
    '\frac{\pi(q,c)}{1-\beta\varphi}',
    'unique global maximum',
    'gross operating present value',
    'qualified manufacturing-service price'
)
foreach ($needle in $requiredFormal) {
    Add-Check ('P02-FORMAL-' + ($needle.GetHashCode().ToString('X8'))) $formalText.Contains($needle) "required=$needle"
}

$forbiddenPatterns = @(
    '(?i)\\eta\b',
    '(?i)\blogit\b',
    '(?i)inclusive\s+value',
    '(?i)representative\s+household',
    '(?i)\bwelfare\b',
    '(?i)portfolio\s+dynamics',
    '(?i)firm\s+entry',
    'x_\{ig\}',
    'R_i\^\{event\}',
    '\\bar\s*R_i\^E'
)
foreach ($pattern in $forbiddenPatterns) {
    $match = [regex]::Match($formalText, $pattern)
    Add-Check ('P02-FORBID-' + ($pattern.GetHashCode().ToString('X8'))) (-not $match.Success) "pattern=$pattern match=$($match.Value)"
}

Add-Check 'P02-SYMBOL-ACTIVE-COUNT' $symbolsText.Contains('There are 37 active rows.') '37 exact-category rows through Phase 2'
foreach ($symbolNeedle in @('| $A$ | primitive parameter |','| $\varepsilon$ | primitive parameter |','| $p$ | control |','| $c$ | endogenous route-level object |','| $\pi(q,c)$ | endogenous route-level object |','| $R(q,c)$ | endogenous route-level object |')) {
    Add-Check ('P02-SYMBOL-' + ($symbolNeedle.GetHashCode().ToString('X8'))) $symbolsText.Contains($symbolNeedle) "required=$symbolNeedle"
}
foreach ($assumptionId in @('A-P02-DEMAND-01','A-P02-PRICE-01','A-P02-PV-01','A-P02-ACCOUNT-01','A-P02-POLICY-01')) {
    Add-Check ('P02-ASSUMPTION-' + $assumptionId) $assumptionsText.Contains($assumptionId) "required=$assumptionId"
}
foreach ($equationId in 1..7) {
    $id = 'P02-E{0:D2}' -f $equationId
    Add-Check ('P02-DEPENDENCY-' + $id) $dependencyText.Contains($id) "required=$id"
}
Add-Check 'P02-OPEN-ISSUES-NO-CURRENT-P0' (-not $issuesText.Contains('Phase: Phase 2') -and -not $issuesText.Contains('Severity now: `P0`')) 'no Phase 2 P0 in open issues'

$allBaselineTex = @(
    [System.IO.File]::ReadAllText((Join-Path $modelRebuild '01_primitives_and_timing.tex'), [System.Text.Encoding]::UTF8),
    $formalText
) -join "`n"
$labels = @([regex]::Matches($allBaselineTex, '\\label\{([^}]+)\}') | ForEach-Object { $_.Groups[1].Value })
$duplicateLabels = @($labels | Group-Object | Where-Object Count -gt 1 | ForEach-Object Name)
Add-Check 'P02-LABEL-UNIQUE' ($duplicateLabels.Count -eq 0) "duplicates=$($duplicateLabels -join ';')"

$logText = if (Test-Path -LiteralPath $latexLogPath) { [System.IO.File]::ReadAllText($latexLogPath, [System.Text.Encoding]::UTF8) } else { '' }
$compileFatal = @(@('! LaTeX Error:', 'Fatal error occurred', 'There were undefined references', 'multiply defined') | Where-Object { $logText.Contains($_) })
Add-Check 'P02-LATEX-FATAL' ($compileFatal.Count -eq 0 -and $logText.Length -gt 0) "fatal=$($compileFatal -join ';')"
$boxWarnings = @([regex]::Matches($logText, '(?m)^(Overfull|Underfull) \\[hv]box')).Count
Add-Check 'P02-LATEX-BOXES' ($boxWarnings -eq 0) "box_warnings=$boxWarnings"

$controlFiles = @($formalPath,$symbolsPath,$dependencyPath,$assumptionsPath,(Join-Path $auditRoot 'phase02_independent_derivation.md'))
$badControl = [System.Collections.Generic.List[string]]::new()
foreach ($path in $controlFiles) {
    $text = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)
    $bad = @($text.ToCharArray() | Where-Object { ([int]$_ -lt 32 -and $_ -notin @("`r","`n","`t")) -or [int]$_ -eq 0xFFFD })
    if ($bad.Count -gt 0) { $badControl.Add($path) }
}
Add-Check 'P02-UTF8-CONTROL' ($badControl.Count -eq 0) "bad=$($badControl -join ';')"

$allowedExact = @(
    'paper/model_notes/00_model_closure_status.md',
    'paper/model_notes/01_symbols_and_objects.md',
    'paper/model_notes/02_equation_dependency_map.md',
    'paper/model_notes/03_assumptions_and_scope.md',
    'paper/model_rebuild/.gitattributes',
    'paper/model_rebuild/.gitignore',
    'paper/model_rebuild/02_demand_profit_derivation.tex',
    'paper/model_rebuild/audit/phase02_artifact_hashes.md',
    'paper/model_rebuild/audit/phase02_audit_results.json',
    'paper/model_rebuild/audit/phase02_commit_manifest.txt',
    'paper/model_rebuild/audit/phase02_compile_console.txt',
    'paper/model_rebuild/audit/phase02_compile_wrapper.tex',
    'paper/model_rebuild/audit/phase02_gate_report.md',
    'paper/model_rebuild/audit/phase02_independent_derivation.md',
    'paper/model_rebuild/audit/phase02_preflight.md',
    'paper/model_rebuild/scripts/audit_phase02.ps1',
    'paper/model_rebuild/scripts/compile_phase_module.ps1',
    'paper/model_rebuild/scripts/finalize_phase.ps1',
    'paper/model_rebuild/scripts/run_phase_gate.ps1',
    'paper/model_rebuild/spec/approvals/phase02_standing_authorization.md',
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
Add-Check 'P02-SCOPE-EXACT' ($unexpected.Count -eq 0) "unexpected=$($unexpected -join ';')"

if ($ExpectedStatus -in @('READY_FOR_APPROVAL','APPROVED')) {
    $gateText = if (Test-Path -LiteralPath $gateReportPath) { [System.IO.File]::ReadAllText($gateReportPath, [System.Text.Encoding]::UTF8) } else { '' }
    $requiredGateIds = @('RL-01','RL-28','P02-D01','P02-G01','QA-PROOF-01','QA-PROOF-02','QA-PROOF-03','QA-PROOF-04','QA-PROOF-05','QA-PROOF-10','QA-ECON-01','QA-ECON-04','QA-ECON-05','QA-ECON-07')
    $missingGateIds = @($requiredGateIds | Where-Object { -not $gateText.Contains($_) })
    Add-Check 'P02-GATE-REPORT-IDS' ($missingGateIds.Count -eq 0) "missing=$($missingGateIds -join ';')"
    Add-Check 'P02-GATE-REPORT-RESULT' ($gateText.Contains('P0: 0') -and $gateText.Contains('Overall gate: PASS')) 'gate reports PASS and zero P0'
}

$failed = @($checks | Where-Object { -not $_.passed })
$result = [ordered]@{
    phase = 2
    expected_status = $ExpectedStatus
    status = if ($failed.Count -eq 0) { $ExpectedStatus } else { 'AUDIT_FAILED' }
    generated_at = (Get-Date).ToString('o')
    passed = @($checks | Where-Object passed).Count
    failed = $failed.Count
    checks = $checks
}
$json = $result | ConvertTo-Json -Depth 6
[System.IO.File]::WriteAllText($jsonPath, $json + "`n", [System.Text.UTF8Encoding]::new($false))
Write-Output "SUMMARY status=$($result.status) passed=$($result.passed) failed=$($result.failed) report=$jsonPath"
foreach ($item in $failed) { Write-Output "FAIL $($item.id): $($item.evidence)" }
if ($failed.Count -gt 0) { exit 1 }
