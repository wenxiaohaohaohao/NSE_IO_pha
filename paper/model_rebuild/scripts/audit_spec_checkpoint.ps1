[CmdletBinding()]
param(
    [ValidateSet('READY_FOR_APPROVAL', 'APPROVED')]
    [string]$ExpectedStatus = 'READY_FOR_APPROVAL'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$modelRebuild = Split-Path -Parent $PSScriptRoot
$paperRoot = Split-Path -Parent $modelRebuild
$repoRoot = Split-Path -Parent $paperRoot
$specRoot = Join-Path $modelRebuild 'spec'
$sourceRoot = Join-Path $specRoot 'source'
$effectivePath = Join-Path $specRoot 'MAH_model_rebuild_effective_spec_v1.2.md'
$matrixPath = Join-Path $specRoot 'instruction_traceability_matrix.csv'
$statusPath = Join-Path $paperRoot 'model_notes\00_model_closure_status.md'
$approvalPath = Join-Path $specRoot 'approvals\specification_v1.2_approval.md'
$reportPath = Join-Path $specRoot 'reports\specification_gate_results.json'

$checks = [System.Collections.Generic.List[object]]::new()

function Add-Check {
    param(
        [Parameter(Mandatory)][string]$Id,
        [Parameter(Mandatory)][bool]$Passed,
        [Parameter(Mandatory)][string]$Evidence
    )
    $checks.Add([pscustomobject]@{
        id = $Id
        passed = $Passed
        evidence = $Evidence
    })
}

function Test-Hash {
    param(
        [Parameter(Mandatory)][string]$Id,
        [Parameter(Mandatory)][string]$Path,
        [Parameter(Mandatory)][string]$Expected
    )
    if (-not (Test-Path -LiteralPath $Path)) {
        Add-Check -Id $Id -Passed $false -Evidence "missing: $Path"
        return
    }
    $actual = (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash
    Add-Check -Id $Id -Passed ($actual -eq $Expected) -Evidence "expected=$Expected actual=$actual"
}

Test-Hash 'HASH-BASE' (Join-Path $sourceRoot 'MAH_model_rebuild_execution_note_for_Codex.md') 'F6C11377D71E4E25D40FFB8AC9FE2EA7AA051AD7E123BA7E3A32DBA895342B24'
Test-Hash 'HASH-AMD11' (Join-Path $sourceRoot 'MAH_model_rebuild_amendment_v1.1_for_Codex.md') 'D76856241E460D31087AB60690E85D5681806E53BD42991F725458727CCD1EA9'
Test-Hash 'HASH-AMD12-IMAGE' (Join-Path $sourceRoot 'MAH_model_rebuild_correction_v1.2.png') '1C0035AB49A5FF5C207CB71C1E3F04CFAC4E333BEDDAB73841D2A72F603723E5'
Test-Hash 'HASH-AMD12-TRANSCRIPTION' (Join-Path $sourceRoot 'MAH_model_rebuild_correction_v1.2_transcription.md') '06AF48B2D853EA82F7176505D2ACA4D0CBFE06E5DB52C18026308196FE85E48E'
Test-Hash 'HASH-EFFECTIVE' $effectivePath '855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666'
Test-Hash 'HASH-MATRIX-CURRENT' $matrixPath '3F0671ED447CB2AF07EB3DED62730A0EF7E15437A9107539B7554E644F18A98F'

$effective = [System.IO.File]::ReadAllText($effectivePath, [System.Text.Encoding]::UTF8)
$redLineStart = $effective.IndexOf('# 2. Absolute Red Lines')
$redLineEnd = $effective.IndexOf('# 3. Required Working Directory')
$redLineBlock = if ($redLineStart -ge 0 -and $redLineEnd -gt $redLineStart) {
    $effective.Substring($redLineStart, $redLineEnd - $redLineStart)
} else {
    ''
}
$redLineNumbers = @([regex]::Matches($redLineBlock, '(?m)^(\d+)\. ') | ForEach-Object { [int]$_.Groups[1].Value })
$expectedRedLines = 1..28
$redLinesPass = ($redLineNumbers.Count -eq 28) -and (-not (Compare-Object $expectedRedLines $redLineNumbers))
Add-Check 'RED-LINES-01-28' $redLinesPass "found=$($redLineNumbers -join ',')"

foreach ($letter in [char[]]'ABCDEFGHIJKLMNOPQRSTUVW') {
    $token = "AMD11-$letter"
    Add-Check "APPLIED-$token" $effective.Contains($token) "construction record contains $token"
}
Add-Check 'APPLIED-AMD12-01' $effective.Contains('AMD12-01') 'construction record contains AMD12-01'
Add-Check 'CANONICAL-X' $effective.Contains('original-drug innovation investment / project-advancement intensity') 'canonical v1.2 definition present'
Add-Check 'NO-CLASS-I-COLLISION' (-not $effective.Contains('g\in\{O,I\}')) 'active novelty notation uses Inc rather than I'
Add-Check 'NO-SEPARATE-XIG-FORMULA' (-not $effective.Contains('a_ix_{ig}^*')) 'no active separate-control outcome formula'
Add-Check 'COMMON-X-RHO-F' ($effective.Contains('F(q,m)=\sum_g\rho_gF_g(q,m)') -and $effective.Contains('\Omega_i=\sum_g\rho_g\Omega_{ig}')) 'common-control mixture identities present'
Add-Check 'TIMING-ANTICIPATION' $effective.Contains('anticipated availability/value of }E') 'anticipated E-option-value chain present'
Add-Check 'TIMING-REALIZATION' $effective.Contains('observed holder--producer separation') 'later realized assignment chain present'
Add-Check 'FULL-DRAFT-PHASE15' ($effective.Contains('assemble and compile `12_full_derivation_draft.tex`') -and $effective.Contains('entry condition for Phase 16')) 'full draft assigned to Phase 15 and approval-gated'
Add-Check 'SHIGU-UNVERIFIED-GATE' ($effective.Contains('remain `UNVERIFIED`') -and $effective.Contains('blocks Phase 16 empirical-boundary prose and Phase 18 manuscript integration')) 'detailed claims are evidence-gated'

$matrix = @(Import-Csv -LiteralPath $matrixPath -Encoding UTF8)
$uniqueIds = @($matrix.requirement_id | Sort-Object -Unique)
Add-Check 'MATRIX-ROW-COUNT' ($matrix.Count -eq 119) "rows=$($matrix.Count)"
Add-Check 'MATRIX-UNIQUE-IDS' ($uniqueIds.Count -eq $matrix.Count) "unique=$($uniqueIds.Count) total=$($matrix.Count)"
$expectedIds = [System.Collections.Generic.List[string]]::new()
foreach ($index in 1..28) { $expectedIds.Add(('RL-{0:D2}' -f $index)) }
foreach ($letter in [char[]]'ABCDEFGHIJKLMNOPQRSTUVW') { $expectedIds.Add("AMD11-$letter") }
$expectedIds.Add('AMD12-01')
foreach ($phase in 1..18) {
    $expectedIds.Add(('P{0:D2}-D01' -f $phase))
    $expectedIds.Add(('P{0:D2}-G01' -f $phase))
}
foreach ($index in 1..10) { $expectedIds.Add(('QA-PROOF-{0:D2}' -f $index)) }
foreach ($index in 1..8) { $expectedIds.Add(('QA-ECON-{0:D2}' -f $index)) }
foreach ($index in 1..13) { $expectedIds.Add(('SUCCESS-{0:D2}' -f $index)) }
$idDelta = @(Compare-Object @($expectedIds) $uniqueIds)
Add-Check 'MATRIX-COMPLETE-ID-SET' ($idDelta.Count -eq 0) "expected=$($expectedIds.Count) actual=$($uniqueIds.Count) delta=$($idDelta | ConvertTo-Json -Compress)"
foreach ($id in @('RL-01','RL-28','AMD11-A','AMD11-W','AMD12-01','P01-D01','P18-G01','QA-PROOF-10','QA-ECON-08','SUCCESS-13')) {
    Add-Check "MATRIX-$id" ($uniqueIds -contains $id) "matrix contains $id"
}

$status = [System.IO.File]::ReadAllText($statusPath, [System.Text.Encoding]::UTF8)
$phaseRows = [regex]::Matches($status, '(?m)^\| (?:[1-9]|1[0-8]) ')
Add-Check 'STATUS-18-PHASES' ($phaseRows.Count -eq 18) "phase_rows=$($phaseRows.Count)"
if ($ExpectedStatus -eq 'APPROVED') {
    Add-Check 'STATUS-SPEC-APPROVED' $status.Contains('Specification status: `APPROVED`') 'specification checkpoint is approved'
    Add-Check 'STATUS-SPEC-COMMIT-AUTHORIZED' $status.Contains('Specification approved to commit/push: `Yes`') 'specification commit and push authorized'
    Add-Check 'STATUS-PHASE1-AUTHORIZED' $status.Contains('Phase 1 authorized: `Yes`') 'Phase 1 authorized after specification push'
    Add-Check 'SPEC-APPROVAL-EVIDENCE' (Test-Path -LiteralPath $approvalPath) "approval record=$approvalPath"
} else {
    Add-Check 'STATUS-SPEC-READY' $status.Contains('Specification status: `READY FOR APPROVAL`') 'specification checkpoint is ready, not approved'
    Add-Check 'STATUS-SPEC-COMMIT-BLOCKED' $status.Contains('Specification approved to commit/push: `No`') 'specification commit and push remain blocked'
    Add-Check 'STATUS-PHASE1-BLOCKED' $status.Contains('Phase 1 authorized: `No`') 'Phase 1 remains unauthorized'
    Add-Check 'SPEC-APPROVAL-NOT-RECORDED' (-not (Test-Path -LiteralPath $approvalPath)) 'approval record must not exist before approval'
}
Add-Check 'STATUS-PHASE1-NOT-STARTED' $status.Contains('| 1 Objects/timing | NOT STARTED |') 'Phase 1 remains not started'
Add-Check 'STATUS-PHASE18-BLOCKED' $status.Contains('| 18 Manuscript integration | BLOCKED |') 'Phase 18 remains blocked'

$branch = (& git -C $repoRoot branch --show-current).Trim()
$lockedBase = 'cd5b6e49608749e0bf32f3d9aa235a84f378347b'
Add-Check 'GIT-BRANCH' ($branch -eq 'codex/mah-model-rebuild') "branch=$branch"
& git -C $repoRoot merge-base --is-ancestor $lockedBase HEAD
Add-Check 'GIT-LOCKED-BASE-ANCESTOR' ($LASTEXITCODE -eq 0) "locked_base=$lockedBase is ancestor of HEAD rc=$LASTEXITCODE"

& git -C $repoRoot diff --quiet $lockedBase -- paper/manuscript
Add-Check 'MANUSCRIPT-READ-ONLY' ($LASTEXITCODE -eq 0) "git diff --quiet base -- paper/manuscript rc=$LASTEXITCODE"
$zipStatus = @(& git -C $repoRoot status --porcelain=v1 -- paper/collaboration/MAH_model_update_20260717.zip)
Add-Check 'ZIP-ISOLATED' ($zipStatus.Count -eq 0) "target-worktree zip status count=$($zipStatus.Count)"

$unexpected = [System.Collections.Generic.List[string]]::new()
foreach ($line in @(& git -C $repoRoot status --porcelain=v1 --untracked-files=all)) {
    if ([string]::IsNullOrWhiteSpace($line)) { continue }
    $path = $line.Substring(3).Trim('"') -replace '\\','/'
    if (-not ($path.StartsWith('paper/model_rebuild/') -or $path.StartsWith('paper/model_notes/'))) {
        $unexpected.Add($line)
    }
}
Add-Check 'WORKTREE-SCOPE' ($unexpected.Count -eq 0) "unexpected=$($unexpected -join '; ')"

$phaseOneFormalFiles = @(
    (Join-Path $modelRebuild '01_primitives_and_timing.tex'),
    (Join-Path $paperRoot 'model_notes\01_symbols_and_objects.md'),
    (Join-Path $paperRoot 'model_notes\02_equation_dependency_map.md'),
    (Join-Path $paperRoot 'model_notes\03_assumptions_and_scope.md')
)
$existingPhaseOne = @($phaseOneFormalFiles | Where-Object { Test-Path -LiteralPath $_ })
Add-Check 'PHASE1-NOT-STARTED' ($existingPhaseOne.Count -eq 0) "existing_phase1_files=$($existingPhaseOne -join '; ')"

$failed = @($checks | Where-Object { -not $_.passed })
$result = [pscustomobject]@{
    checkpoint = 'SPECIFICATION_v1.2'
    status = if ($failed.Count -eq 0) { $ExpectedStatus } else { 'AUDIT_FAILED' }
    generated_at = (Get-Date).ToString('o')
    passed = $checks.Count - $failed.Count
    failed = $failed.Count
    checks = $checks
}

$json = $result | ConvertTo-Json -Depth 6
[System.IO.File]::WriteAllText($reportPath, $json + [Environment]::NewLine, (New-Object System.Text.UTF8Encoding($false)))

foreach ($check in $checks) {
    $mark = if ($check.passed) { 'PASS' } else { 'FAIL' }
    Write-Output "[$mark] $($check.id): $($check.evidence)"
}
Write-Output "SUMMARY status=$($result.status) passed=$($result.passed) failed=$($result.failed) report=$reportPath"

if ($failed.Count -gt 0) {
    exit 1
}
