[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [ValidateSet('IN_PROGRESS','READY_FOR_APPROVAL','APPROVED')]
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
$crosswalkPath = Join-Path $notesRoot '05_old_to_new_model_crosswalk.md'
$inventoryPath = Join-Path $auditRoot 'phase12_legacy_occurrence_index.csv'
$statusPath = Join-Path $notesRoot '00_model_closure_status.md'
$matrixPath = Join-Path $specRoot 'instruction_traceability_matrix.csv'
$gateReportPath = Join-Path $auditRoot 'phase12_gate_report.md'
$independentPath = Join-Path $auditRoot 'phase12_independent_crosswalk_audit.md'
$latexLogPath = Join-Path $auditRoot 'build_phase12\phase12_compile_wrapper.log'
$pdfPath = Join-Path $auditRoot 'build_phase12\phase12_compile_wrapper.pdf'
$jsonPath = Join-Path $auditRoot 'phase12_audit_results.json'
$lockedBase = 'cd5b6e49608749e0bf32f3d9aa235a84f378347b'
$entryCommit = 'b06be5ac3499df9b7493081f5febde0fb68274a6'
$checks = [Collections.Generic.List[object]]::new()

function Add-Check {
    param([string]$Id,[bool]$Passed,[string]$Evidence)
    $checks.Add([pscustomobject]@{id=$Id;passed=$Passed;evidence=$Evidence})
}
function Test-Hash {
    param([string]$Id,[string]$Path,[string]$Expected)
    $actual = if (Test-Path -LiteralPath $Path -PathType Leaf) {
        (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash
    } else { 'MISSING' }
    Add-Check $Id ($actual -eq $Expected) "expected=$Expected actual=$actual"
}

foreach ($source in @(
    @('P12-HASH-BASE','MAH_model_rebuild_execution_note_for_Codex.md','F6C11377D71E4E25D40FFB8AC9FE2EA7AA051AD7E123BA7E3A32DBA895342B24'),
    @('P12-HASH-AMD11','MAH_model_rebuild_amendment_v1.1_for_Codex.md','D76856241E460D31087AB60690E85D5681806E53BD42991F725458727CCD1EA9'),
    @('P12-HASH-AMD12-IMAGE','MAH_model_rebuild_correction_v1.2.png','1C0035AB49A5FF5C207CB71C1E3F04CFAC4E333BEDDAB73841D2A72F603723E5'),
    @('P12-HASH-AMD12-TEXT','MAH_model_rebuild_correction_v1.2_transcription.md','06AF48B2D853EA82F7176505D2ACA4D0CBFE06E5DB52C18026308196FE85E48E')
)) {
    Test-Hash $source[0] (Join-Path $sourceRoot $source[1]) $source[2]
}
Test-Hash 'P12-HASH-EFFECTIVE' (Join-Path $specRoot 'MAH_model_rebuild_effective_spec_v1.2.md') '855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666'

$branch = (& git -C $repoRoot branch --show-current).Trim()
$head = (& git -C $repoRoot rev-parse HEAD).Trim()
$remote = (& git -C $repoRoot rev-parse origin/codex/mah-model-rebuild).Trim()
Add-Check 'P12-GIT-BRANCH' ($branch -eq 'codex/mah-model-rebuild') "branch=$branch"
Add-Check 'P12-GIT-ENTRY' ($head -eq $entryCommit) "head=$head"
Add-Check 'P12-GIT-REMOTE' ($remote -eq $head) "remote=$remote"

$manuscriptDiff = @(& git -C $repoRoot diff --name-only $lockedBase -- paper/manuscript)
$legacyNotesDiff = @(& git -C $repoRoot diff --name-only $lockedBase -- research_notes/model_notes)
$zipStatus = @(& git -C $repoRoot status --porcelain=v1 -- paper/collaboration/MAH_model_update_20260717.zip)
Add-Check 'P12-MANUSCRIPT-READ-ONLY' ($manuscriptDiff.Count -eq 0) "changed=$($manuscriptDiff -join ';')"
Add-Check 'P12-LEGACY-NOTES-READ-ONLY' ($legacyNotesDiff.Count -eq 0) "changed=$($legacyNotesDiff -join ';')"
Add-Check 'P12-ZIP-ISOLATED' ($zipStatus.Count -eq 0) "count=$($zipStatus.Count)"

foreach ($path in @(
    $crosswalkPath,
    $inventoryPath,
    (Join-Path $auditRoot 'phase12_preflight.md'),
    $independentPath,
    (Join-Path $auditRoot 'phase12_compile_wrapper.tex'),
    (Join-Path $auditRoot 'phase12_compile_console.txt'),
    $latexLogPath,
    $pdfPath
)) {
    Add-Check ('P12-FILE-' + [IO.Path]::GetFileName($path)) (Test-Path -LiteralPath $path -PathType Leaf) "path=$path"
}

$statusText = [IO.File]::ReadAllText($statusPath,[Text.Encoding]::UTF8)
$statusNeedle = "| 12 Old-to-new crosswalk | $($ExpectedStatus -replace '_',' ') |"
Add-Check 'P12-STATE-PHASE11' $statusText.Contains('| 11 Extensions | APPROVED |') 'Phase 11 approved'
Add-Check 'P12-STATE-PHASE12' $statusText.Contains($statusNeedle) "expected=$statusNeedle"
Add-Check 'P12-STATE-PHASE13' $statusText.Contains('| 13 Equation dependency map | NOT STARTED |') 'Phase 13 not started'

$matrix = Import-Csv -LiteralPath $matrixPath
$expectedApproval = if ($ExpectedStatus -eq 'APPROVED') { 'YES' } else { 'NO' }
foreach ($id in @('P12-D01','P12-G01')) {
    $row = @($matrix | Where-Object requirement_id -eq $id)
    $rowStatus = if ($row.Count -eq 1) { $row[0].current_status } else { 'BAD_ROW' }
    $rowApproval = if ($row.Count -eq 1) { $row[0].approval_status } else { 'BAD_ROW' }
    Add-Check ('P12-MATRIX-' + $id) ($row.Count -eq 1 -and $rowStatus -eq $ExpectedStatus -and $rowApproval -eq $expectedApproval) "status=$rowStatus approval=$rowApproval"
}

$crosswalk = [IO.File]::ReadAllText($crosswalkPath,[Text.Encoding]::UTF8)
$independent = [IO.File]::ReadAllText($independentPath,[Text.Encoding]::UTF8)
foreach ($id in 1..24 | ForEach-Object { 'CW-{0:D2}' -f $_ }) {
    Add-Check ('P12-CROSSWALK-' + $id) ($crosswalk.Contains($id)) "required=$id"
}
foreach ($word in @(
    'DELETE','REPLACE','RETAIN','QUARANTINE',
    'equations','propositions','narrative paragraphs',
    'calibration/empirical claims','appendix material','legacy notes',
    'Phase 18 action','read-only','1,242','no \(x_{ig}\)',
    'patent applications','\(\rho_O=0\)','\(\rho_{\mathrm{Inc}}=0\)'
)) {
    Add-Check ('P12-CROSSWALK-TEXT-' + $word.GetHashCode().ToString('X8')) ($crosswalk.Contains($word)) "required=$word"
}

$inventory = @(Import-Csv -LiteralPath $inventoryPath)
Add-Check 'P12-INVENTORY-ROWS' ($inventory.Count -eq 1242) "rows=$($inventory.Count)"
$expectedIds = @(1..24 | ForEach-Object { 'CW-{0:D2}' -f $_ })
$actualIds = @($inventory.object_id | Sort-Object -Unique)
Add-Check 'P12-INVENTORY-IDS' (($actualIds -join ',') -eq ($expectedIds -join ',')) "ids=$($actualIds -join ',')"
$expectedFiles = @(
    'paper/manuscript/mah_route_indicator_friction_model.tex',
    'paper/manuscript/mah_route_indicator_friction_model_appendix.tex',
    'research_notes/model_notes/00_model_closure_status.md',
    'research_notes/model_notes/01_symbols_and_objects.md',
    'research_notes/model_notes/02_equation_dependency_map.md',
    'research_notes/model_notes/03_assumptions_and_scope.md',
    'research_notes/model_notes/04_comparative_statics_checklist.md',
    'research_notes/model_notes/05_calibration_mapping.md',
    'research_notes/model_notes/06_bellman_accounting.md',
    'research_notes/model_notes/08_model_closure_audit.md',
    'research_notes/model_notes/10_main_appendix_consistency_audit.md',
    'research_notes/model_notes/11_proposition_dependency_audit.md',
    'research_notes/model_notes/12_calibration_claim_audit.md'
)
$actualFiles = @($inventory.source_file | Sort-Object -Unique)
Add-Check 'P12-INVENTORY-FILES' (($actualFiles -join ',') -eq (($expectedFiles | Sort-Object) -join ',')) "file_count=$($actualFiles.Count)"

$sourceLineCache = @{}
$rowMismatch = [Collections.Generic.List[string]]::new()
foreach ($row in $inventory) {
    if (-not $sourceLineCache.ContainsKey($row.source_file)) {
        $sourceLineCache[$row.source_file] = [IO.File]::ReadAllLines((Join-Path $repoRoot $row.source_file),[Text.Encoding]::UTF8)
    }
    $lineNumber = [int]$row.line
    $lines = $sourceLineCache[$row.source_file]
    if ($lineNumber -lt 1 -or $lineNumber -gt $lines.Length -or $lines[$lineNumber-1].Trim() -ne $row.text) {
        $rowMismatch.Add("$($row.object_id):$($row.source_file):$lineNumber")
    }
}
Add-Check 'P12-INVENTORY-SOURCE-MATCH' ($rowMismatch.Count -eq 0) "mismatches=$($rowMismatch -join ';')"
foreach ($role in @('equation','proposition','calibration-or-empirical','appendix','legacy-note')) {
    $count = @($inventory | Where-Object { $_.context_kind -match [regex]::Escape($role) }).Count
    Add-Check ('P12-INVENTORY-ROLE-' + $role.ToUpper().Replace('-','_')) ($count -gt 0) "count=$count"
}

Add-Check 'P12-INDEPENDENT' (
    $independent.Contains('no P0 and no new P1') -and
    $independent.Contains('1,242 rows') -and
    $independent.Contains('all 24 CW IDs')
) 'independent crosswalk review'

$baselineFiles = 1..10 | ForEach-Object {
    $tag = '{0:D2}' -f $_
    Get-ChildItem -LiteralPath $modelRebuild -Filter ($tag + '_*.tex') | Select-Object -First 1
}
$baselineText = ($baselineFiles | ForEach-Object {
    [IO.File]::ReadAllText($_.FullName,[Text.Encoding]::UTF8)
}) -join [Environment]::NewLine
foreach ($pattern in @(
    'P_\{ir\}\^\{\\mathrm\{logit\}\}',
    '\\Gamma_i\s*\(',
    'x_i\^R\s*\+.*x_i\^D',
    '\\eta\\in\[0,1\]',
    'N_E\('
)) {
    $match = [regex]::Match($baselineText,$pattern,[Text.RegularExpressions.RegexOptions]::IgnoreCase)
    Add-Check ('P12-BASELINE-CLEAN-' + $pattern.GetHashCode().ToString('X8')) (-not $match.Success) "pattern=$pattern match=$($match.Value)"
}

$allLabels = [Collections.Generic.List[string]]::new()
foreach ($file in $baselineFiles) {
    $text = [IO.File]::ReadAllText($file.FullName,[Text.Encoding]::UTF8)
    foreach ($match in [regex]::Matches($text,'\\label\{([^}]+)\}')) {
        $allLabels.Add($match.Groups[1].Value)
    }
}
$duplicates = @($allLabels | Group-Object | Where-Object Count -gt 1)
$duplicateNames = @($duplicates | ForEach-Object { $_.Name })
Add-Check 'P12-LABEL-UNIQUE' ($duplicates.Count -eq 0) "duplicates=$($duplicateNames -join ';')"
$latexLog = if (Test-Path -LiteralPath $latexLogPath) {
    [IO.File]::ReadAllText($latexLogPath,[Text.Encoding]::UTF8)
} else { '' }
$fatal = @(@('! LaTeX Error:','Fatal error occurred','There were undefined references','multiply defined') | Where-Object { $latexLog.Contains($_) })
$boxes = @([regex]::Matches($latexLog,'(?m)^(Overfull|Underfull) \\[hv]box')).Count
Add-Check 'P12-LATEX-FATAL' ($fatal.Count -eq 0 -and $latexLog.Length -gt 0) "fatal=$($fatal -join ';')"
Add-Check 'P12-LATEX-BOXES' ($boxes -eq 0) "box_warnings=$boxes"

$allowed = @(
    'paper/model_notes/00_model_closure_status.md',
    'paper/model_notes/05_old_to_new_model_crosswalk.md',
    'paper/model_rebuild/.gitattributes',
    'paper/model_rebuild/audit/phase12_artifact_hashes.md',
    'paper/model_rebuild/audit/phase12_audit_results.json',
    'paper/model_rebuild/audit/phase12_commit_manifest.txt',
    'paper/model_rebuild/audit/phase12_compile_console.txt',
    'paper/model_rebuild/audit/phase12_compile_wrapper.tex',
    'paper/model_rebuild/audit/phase12_gate_report.md',
    'paper/model_rebuild/audit/phase12_independent_crosswalk_audit.md',
    'paper/model_rebuild/audit/phase12_legacy_occurrence_index.csv',
    'paper/model_rebuild/audit/phase12_preflight.md',
    'paper/model_rebuild/scripts/audit_phase12.ps1',
    'paper/model_rebuild/scripts/build_phase12_legacy_inventory.ps1',
    'paper/model_rebuild/spec/approvals/phase12_standing_authorization.md',
    'paper/model_rebuild/spec/instruction_traceability_matrix.csv',
    'paper/model_rebuild/spec/specification_hashes.md'
)
$allowedSet = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
foreach ($path in $allowed) { [void]$allowedSet.Add($path) }
$unexpected = [Collections.Generic.List[string]]::new()
foreach ($line in @(& git -C $repoRoot status --porcelain=v1 --untracked-files=all)) {
    if ([string]::IsNullOrWhiteSpace($line)) { continue }
    $path = $line.Substring(3).Replace('\','/')
    if (-not $allowedSet.Contains($path)) { $unexpected.Add($path) }
}
Add-Check 'P12-SCOPE-EXACT' ($unexpected.Count -eq 0) "unexpected=$($unexpected -join ';')"

if ($ExpectedStatus -in @('READY_FOR_APPROVAL','APPROVED')) {
    $gate = if (Test-Path -LiteralPath $gateReportPath) {
        [IO.File]::ReadAllText($gateReportPath,[Text.Encoding]::UTF8)
    } else { '' }
    $requiredGateIds = @('RL-01','RL-28','AMD11-N','AMD12-01','P12-D01','P12-G01','QA-PROOF-10','QA-ECON-01','QA-ECON-02','QA-ECON-05','QA-ECON-07','QA-ECON-08')
    $missingGateIds = @($requiredGateIds | Where-Object { -not $gate.Contains($_) })
    Add-Check 'P12-GATE-IDS' ($missingGateIds.Count -eq 0) "missing=$($missingGateIds -join ';')"
    Add-Check 'P12-GATE-RESULT' ($gate.Contains('P0: 0') -and $gate.Contains('Overall gate: PASS')) 'gate PASS'
}

$failed = @($checks | Where-Object { -not $_.passed })
$result = [ordered]@{
    phase = 12
    expected_status = $ExpectedStatus
    status = if ($failed.Count -eq 0) { $ExpectedStatus } else { 'AUDIT_FAILED' }
    generated_at = (Get-Date).ToString('o')
    passed = @($checks | Where-Object passed).Count
    failed = $failed.Count
    checks = $checks
}
[IO.File]::WriteAllText($jsonPath,($result | ConvertTo-Json -Depth 6)+[Environment]::NewLine,[Text.UTF8Encoding]::new($false))
Write-Output "SUMMARY status=$($result.status) passed=$($result.passed) failed=$($result.failed) report=$jsonPath"
foreach ($item in $failed) { Write-Output "FAIL $($item.id): $($item.evidence)" }
if ($failed.Count -gt 0) { exit 1 }
