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
$mapPath = Join-Path $notesRoot '02_equation_dependency_map.md'
$catalogPath = Join-Path $auditRoot 'phase13_equation_catalog.csv'
$statusPath = Join-Path $notesRoot '00_model_closure_status.md'
$matrixPath = Join-Path $specRoot 'instruction_traceability_matrix.csv'
$gateReportPath = Join-Path $auditRoot 'phase13_gate_report.md'
$independentPath = Join-Path $auditRoot 'phase13_independent_dependency_audit.md'
$latexLogPath = Join-Path $auditRoot 'build_phase13\phase13_compile_wrapper.log'
$pdfPath = Join-Path $auditRoot 'build_phase13\phase13_compile_wrapper.pdf'
$jsonPath = Join-Path $auditRoot 'phase13_audit_results.json'
$lockedBase = 'cd5b6e49608749e0bf32f3d9aa235a84f378347b'
$entryCommit = 'a4c2a2bef96f09d62932d182c72cb6a389a88a97'
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
    @('P13-HASH-BASE','MAH_model_rebuild_execution_note_for_Codex.md','F6C11377D71E4E25D40FFB8AC9FE2EA7AA051AD7E123BA7E3A32DBA895342B24'),
    @('P13-HASH-AMD11','MAH_model_rebuild_amendment_v1.1_for_Codex.md','D76856241E460D31087AB60690E85D5681806E53BD42991F725458727CCD1EA9'),
    @('P13-HASH-AMD12-IMAGE','MAH_model_rebuild_correction_v1.2.png','1C0035AB49A5FF5C207CB71C1E3F04CFAC4E333BEDDAB73841D2A72F603723E5'),
    @('P13-HASH-AMD12-TEXT','MAH_model_rebuild_correction_v1.2_transcription.md','06AF48B2D853EA82F7176505D2ACA4D0CBFE06E5DB52C18026308196FE85E48E')
)) {
    Test-Hash $source[0] (Join-Path $sourceRoot $source[1]) $source[2]
}
Test-Hash 'P13-HASH-EFFECTIVE' (Join-Path $specRoot 'MAH_model_rebuild_effective_spec_v1.2.md') '855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666'

$branch = (& git -C $repoRoot branch --show-current).Trim()
$head = (& git -C $repoRoot rev-parse HEAD).Trim()
$remote = (& git -C $repoRoot rev-parse origin/codex/mah-model-rebuild).Trim()
Add-Check 'P13-GIT-BRANCH' ($branch -eq 'codex/mah-model-rebuild') "branch=$branch"
Add-Check 'P13-GIT-ENTRY' ($head -eq $entryCommit) "head=$head"
Add-Check 'P13-GIT-REMOTE' ($remote -eq $head) "remote=$remote"

$manuscriptDiff = @(& git -C $repoRoot diff --name-only $lockedBase -- paper/manuscript)
$zipStatus = @(& git -C $repoRoot status --porcelain=v1 -- paper/collaboration/MAH_model_update_20260717.zip)
Add-Check 'P13-MANUSCRIPT-READ-ONLY' ($manuscriptDiff.Count -eq 0) "changed=$($manuscriptDiff -join ';')"
Add-Check 'P13-ZIP-ISOLATED' ($zipStatus.Count -eq 0) "count=$($zipStatus.Count)"

foreach ($path in @(
    $mapPath,$catalogPath,
    (Join-Path $auditRoot 'phase13_preflight.md'),
    $independentPath,
    (Join-Path $auditRoot 'phase13_compile_wrapper.tex'),
    (Join-Path $auditRoot 'phase13_compile_console.txt'),
    $latexLogPath,$pdfPath
)) {
    Add-Check ('P13-FILE-' + [IO.Path]::GetFileName($path)) (Test-Path -LiteralPath $path -PathType Leaf) "path=$path"
}

$statusText = [IO.File]::ReadAllText($statusPath,[Text.Encoding]::UTF8)
$statusNeedle = "| 13 Equation dependency map | $($ExpectedStatus -replace '_',' ') |"
Add-Check 'P13-STATE-PHASE12' ($statusText.Contains('| 12 Old-to-new crosswalk | APPROVED |')) 'Phase 12 approved'
Add-Check 'P13-STATE-PHASE13' ($statusText.Contains($statusNeedle)) "expected=$statusNeedle"
Add-Check 'P13-STATE-PHASE14' ($statusText.Contains('| 14 Assumption discipline | NOT STARTED |')) 'Phase 14 not started'

$matrix = Import-Csv -LiteralPath $matrixPath
$expectedApproval = if ($ExpectedStatus -eq 'APPROVED') { 'YES' } else { 'NO' }
foreach ($id in @('P13-D01','P13-G01')) {
    $row = @($matrix | Where-Object requirement_id -eq $id)
    $rowStatus = if ($row.Count -eq 1) { $row[0].current_status } else { 'BAD_ROW' }
    $rowApproval = if ($row.Count -eq 1) { $row[0].approval_status } else { 'BAD_ROW' }
    Add-Check ('P13-MATRIX-' + $id) ($row.Count -eq 1 -and $rowStatus -eq $ExpectedStatus -and $rowApproval -eq $expectedApproval) "status=$rowStatus approval=$rowApproval"
}

$map = [IO.File]::ReadAllText($mapPath,[Text.Encoding]::UTF8)
$mapLines = [IO.File]::ReadAllLines($mapPath,[Text.Encoding]::UTF8)
$catalog = @(Import-Csv -LiteralPath $catalogPath)
Add-Check 'P13-CATALOG-COUNT' ($catalog.Count -eq 89) "rows=$($catalog.Count)"
$catalogLabels = @($catalog.equation_label | Sort-Object -Unique)
Add-Check 'P13-CATALOG-UNIQUE' ($catalogLabels.Count -eq 89) "unique=$($catalogLabels.Count)"
$phaseCounts = @($catalog | Group-Object phase | Sort-Object { [int]$_.Name } | ForEach-Object { "$($_.Name):$($_.Count)" })
Add-Check 'P13-CATALOG-PHASE-COUNTS' (($phaseCounts -join ',') -eq '1:10,2:9,3:7,4:11,5:11,6:11,7:5,8:18,9:5,10:2') "counts=$($phaseCounts -join ',')"

$sourceMismatches = [Collections.Generic.List[string]]::new()
foreach ($row in $catalog) {
    $sourcePath = Join-Path $modelRebuild $row.source_file
    $sourceLines = [IO.File]::ReadAllLines($sourcePath,[Text.Encoding]::UTF8)
    $line = [int]$row.source_line
    if ($line -lt 1 -or $line -gt $sourceLines.Length -or -not $sourceLines[$line-1].Contains("\label{$($row.equation_label)}")) {
        $sourceMismatches.Add("$($row.source_file):$($line):$($row.equation_label)")
    }
}
Add-Check 'P13-CATALOG-SOURCE-MATCH' ($sourceMismatches.Count -eq 0) "mismatches=$($sourceMismatches -join ';')"

$ledgerLines = @($mapLines | Where-Object { $_ -match '^\|.*eq:p\d{2}-' })
$ledgerLabels = [Collections.Generic.List[string]]::new()
foreach ($line in $ledgerLines) {
    foreach ($match in [regex]::Matches($line,'eq:p\d{2}-[A-Za-z0-9-]+')) {
        $ledgerLabels.Add($match.Value)
    }
}
$uniqueLedgerLabels = @($ledgerLabels | Sort-Object -Unique)
Add-Check 'P13-LEDGER-ROWS' ($ledgerLines.Count -eq 89) "rows=$($ledgerLines.Count)"
Add-Check 'P13-LEDGER-UNIQUE' ($uniqueLedgerLabels.Count -eq 89 -and $ledgerLabels.Count -eq 89) "labels=$($ledgerLabels.Count) unique=$($uniqueLedgerLabels.Count)"
$missing = @($catalogLabels | Where-Object { $_ -notin $uniqueLedgerLabels })
$extra = @($uniqueLedgerLabels | Where-Object { $_ -notin $catalogLabels })
Add-Check 'P13-LEDGER-COVERAGE' ($missing.Count -eq 0 -and $extra.Count -eq 0) "missing=$($missing -join ';') extra=$($extra -join ';')"

$headings = @($mapLines | Where-Object { $_ -match '^## \d+\.' })
$headingNumbers = @($headings | ForEach-Object { [int]([regex]::Match($_,'^## (\d+)\.').Groups[1].Value) })
Add-Check 'P13-HEADING-SEQUENCE' (($headingNumbers -join ',') -eq ((1..17) -join ',')) "headings=$($headingNumbers -join ',')"

foreach ($required in @(
    'Z_M(p)','candidate-price','The only feedback is the outer scalar root',
    'zero-measure route ties','integrable envelope',
    'finite, continuous, nonnegative, and weakly decreasing',
    'continuous and strictly increasing','Z_M(0)>0',
    'strict decrease of \(Z_M\)','p_m^*(1)\geq p_m^*(0)',
    '\Delta\Omega_i^{eq}','\Delta x_i^{eq}',
    'Fixed-price and equilibrium-price separation',
    'M\longrightarrow\tau_E(M)','a second market-clearing equation'
)) {
    Add-Check ('P13-MAP-TEXT-' + $required.GetHashCode().ToString('X8')) ($map.Contains($required)) "required=$required"
}
foreach ($stale in @('No sign is imposed on the cross-regime change','allowed but not-yet-proved','[DEFERRED: Phase 9]')) {
    Add-Check ('P13-MAP-NO-STALE-' + $stale.GetHashCode().ToString('X8')) (-not $map.Contains($stale)) "forbidden=$stale"
}

$independent = [IO.File]::ReadAllText($independentPath,[Text.Encoding]::UTF8)
Add-Check 'P13-INDEPENDENT' (
    $independent.Contains('89 unique labeled equations') -and
    $independent.Contains('no unresolved inner cycle') -and
    $independent.Contains('no P0 and no P1')
) 'independent dependency audit'

$baselineFiles = 1..10 | ForEach-Object {
    $tag = '{0:D2}' -f $_
    Get-ChildItem -LiteralPath $modelRebuild -Filter ($tag + '_*.tex') | Select-Object -First 1
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
Add-Check 'P13-LABEL-UNIQUE' ($duplicates.Count -eq 0) "duplicates=$($duplicateNames -join ';')"
$latexLog = if (Test-Path -LiteralPath $latexLogPath) {
    [IO.File]::ReadAllText($latexLogPath,[Text.Encoding]::UTF8)
} else { '' }
$fatal = @(@('! LaTeX Error:','Fatal error occurred','There were undefined references','multiply defined') | Where-Object { $latexLog.Contains($_) })
$boxes = @([regex]::Matches($latexLog,'(?m)^(Overfull|Underfull) \\[hv]box')).Count
Add-Check 'P13-LATEX-FATAL' ($fatal.Count -eq 0 -and $latexLog.Length -gt 0) "fatal=$($fatal -join ';')"
Add-Check 'P13-LATEX-BOXES' ($boxes -eq 0) "box_warnings=$boxes"

$allowed = @(
    'paper/model_notes/00_model_closure_status.md',
    'paper/model_notes/02_equation_dependency_map.md',
    'paper/model_rebuild/.gitattributes',
    'paper/model_rebuild/audit/phase13_artifact_hashes.md',
    'paper/model_rebuild/audit/phase13_audit_results.json',
    'paper/model_rebuild/audit/phase13_commit_manifest.txt',
    'paper/model_rebuild/audit/phase13_compile_console.txt',
    'paper/model_rebuild/audit/phase13_compile_wrapper.tex',
    'paper/model_rebuild/audit/phase13_equation_catalog.csv',
    'paper/model_rebuild/audit/phase13_gate_report.md',
    'paper/model_rebuild/audit/phase13_independent_dependency_audit.md',
    'paper/model_rebuild/audit/phase13_preflight.md',
    'paper/model_rebuild/scripts/audit_phase13.ps1',
    'paper/model_rebuild/scripts/build_phase13_equation_catalog.ps1',
    'paper/model_rebuild/spec/approvals/phase13_standing_authorization.md',
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
Add-Check 'P13-SCOPE-EXACT' ($unexpected.Count -eq 0) "unexpected=$($unexpected -join ';')"

if ($ExpectedStatus -in @('READY_FOR_APPROVAL','APPROVED')) {
    $gate = if (Test-Path -LiteralPath $gateReportPath) {
        [IO.File]::ReadAllText($gateReportPath,[Text.Encoding]::UTF8)
    } else { '' }
    $requiredGateIds = @('RL-01','RL-28','P13-D01','P13-G01','QA-PROOF-05','QA-PROOF-06','QA-PROOF-07','QA-PROOF-09','QA-PROOF-10','QA-ECON-01','QA-ECON-04','QA-ECON-05')
    $missingGateIds = @($requiredGateIds | Where-Object { -not $gate.Contains($_) })
    Add-Check 'P13-GATE-IDS' ($missingGateIds.Count -eq 0) "missing=$($missingGateIds -join ';')"
    Add-Check 'P13-GATE-RESULT' ($gate.Contains('P0: 0') -and $gate.Contains('Overall gate: PASS')) 'gate PASS'
}

$failed = @($checks | Where-Object { -not $_.passed })
$result = [ordered]@{
    phase = 13
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
