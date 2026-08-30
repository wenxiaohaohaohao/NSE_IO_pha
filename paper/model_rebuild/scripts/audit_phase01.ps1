[CmdletBinding()]
param(
    [ValidateSet('IN_PROGRESS', 'READY_FOR_APPROVAL')]
    [string]$ExpectedStatus = 'IN_PROGRESS'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$modelRebuild = Split-Path -Parent $PSScriptRoot
$paperRoot = Split-Path -Parent $modelRebuild
$repoRoot = Split-Path -Parent $paperRoot
$notesRoot = Join-Path $paperRoot 'model_notes'
$specRoot = Join-Path $modelRebuild 'spec'
$auditRoot = Join-Path $modelRebuild 'audit'
$sourceRoot = Join-Path $specRoot 'source'
$texPath = Join-Path $modelRebuild '01_primitives_and_timing.tex'
$symbolsPath = Join-Path $notesRoot '01_symbols_and_objects.md'
$dependencyPath = Join-Path $notesRoot '02_equation_dependency_map.md'
$assumptionsPath = Join-Path $notesRoot '03_assumptions_and_scope.md'
$statusPath = Join-Path $notesRoot '00_model_closure_status.md'
$issuesPath = Join-Path $notesRoot '06_open_issues_log.md'
$matrixPath = Join-Path $specRoot 'instruction_traceability_matrix.csv'
$gateReportPath = Join-Path $auditRoot 'phase01_gate_report.md'
$jsonPath = Join-Path $auditRoot 'phase01_audit_results.json'
$pdfPath = Join-Path $auditRoot 'build_phase01\phase01_compile_wrapper.pdf'
$latexLogPath = Join-Path $auditRoot 'build_phase01\phase01_compile_wrapper.log'
$consoleLogPath = Join-Path $auditRoot 'phase01_compile_console.txt'

$checks = [System.Collections.Generic.List[object]]::new()

function Add-Check {
    param(
        [Parameter(Mandatory)][string]$Id,
        [Parameter(Mandatory)][bool]$Passed,
        [Parameter(Mandatory)][string]$Evidence
    )
    $checks.Add([pscustomobject]@{ id = $Id; passed = $Passed; evidence = $Evidence })
}

function Test-Hash {
    param(
        [Parameter(Mandatory)][string]$Id,
        [Parameter(Mandatory)][string]$Path,
        [Parameter(Mandatory)][string]$Expected
    )
    if (-not (Test-Path -LiteralPath $Path)) {
        Add-Check $Id $false "missing=$Path"
        return
    }
    $actual = (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash
    Add-Check $Id ($actual -eq $Expected) "expected=$Expected actual=$actual"
}

Test-Hash 'P01-HASH-BASE' (Join-Path $sourceRoot 'MAH_model_rebuild_execution_note_for_Codex.md') 'F6C11377D71E4E25D40FFB8AC9FE2EA7AA051AD7E123BA7E3A32DBA895342B24'
Test-Hash 'P01-HASH-AMD11' (Join-Path $sourceRoot 'MAH_model_rebuild_amendment_v1.1_for_Codex.md') 'D76856241E460D31087AB60690E85D5681806E53BD42991F725458727CCD1EA9'
Test-Hash 'P01-HASH-AMD12-IMAGE' (Join-Path $sourceRoot 'MAH_model_rebuild_correction_v1.2.png') '1C0035AB49A5FF5C207CB71C1E3F04CFAC4E333BEDDAB73841D2A72F603723E5'
Test-Hash 'P01-HASH-AMD12-TEXT' (Join-Path $sourceRoot 'MAH_model_rebuild_correction_v1.2_transcription.md') '06AF48B2D853EA82F7176505D2ACA4D0CBFE06E5DB52C18026308196FE85E48E'
Test-Hash 'P01-HASH-EFFECTIVE' (Join-Path $specRoot 'MAH_model_rebuild_effective_spec_v1.2.md') '855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666'

$branch = (& git -C $repoRoot branch --show-current).Trim()
$specCommit = '5fc7f352cb244dac09da4d4567bc331eaaa29dda'
Add-Check 'P01-GIT-BRANCH' ($branch -eq 'codex/mah-model-rebuild') "branch=$branch"
& git -C $repoRoot merge-base --is-ancestor $specCommit HEAD
Add-Check 'P01-GIT-SPEC-ANCESTOR' ($LASTEXITCODE -eq 0) "spec_commit=$specCommit ancestor_of_HEAD rc=$LASTEXITCODE"
& git -C $repoRoot merge-base --is-ancestor $specCommit origin/codex/mah-model-rebuild
Add-Check 'P01-GIT-SPEC-PUSHED' ($LASTEXITCODE -eq 0) "spec_commit=$specCommit ancestor_of_remote rc=$LASTEXITCODE"

& git -C $repoRoot diff --quiet cd5b6e49608749e0bf32f3d9aa235a84f378347b -- paper/manuscript
Add-Check 'P01-MANUSCRIPT-READ-ONLY' ($LASTEXITCODE -eq 0) "manuscript diff against locked base rc=$LASTEXITCODE"
$zipStatus = @(& git -C $repoRoot status --porcelain=v1 -- paper/collaboration/MAH_model_update_20260717.zip)
Add-Check 'P01-ZIP-ISOLATED' ($zipStatus.Count -eq 0) "target-worktree zip status count=$($zipStatus.Count)"

$requiredFiles = @(
    $texPath,
    $symbolsPath,
    $dependencyPath,
    $assumptionsPath,
    (Join-Path $auditRoot 'phase01_preflight.md'),
    (Join-Path $auditRoot 'phase01_compile_wrapper.tex'),
    (Join-Path $auditRoot 'phase01_artifact_hashes.md'),
    (Join-Path $modelRebuild 'scripts\compile_phase01.ps1'),
    $consoleLogPath,
    $pdfPath,
    $latexLogPath
)
foreach ($path in $requiredFiles) {
    Add-Check ('P01-FILE-' + [System.IO.Path]::GetFileName($path)) (Test-Path -LiteralPath $path) "path=$path"
}

$phaseTwoFiles = @(
    (Join-Path $modelRebuild '02_demand_profit_derivation.tex'),
    (Join-Path $modelRebuild '03_internal_external_technologies.tex')
)
$existingLaterFiles = @($phaseTwoFiles | Where-Object { Test-Path -LiteralPath $_ })
Add-Check 'P01-NO-LATER-PHASE-FILES' ($existingLaterFiles.Count -eq 0) "existing=$($existingLaterFiles -join '; ')"

$statusText = [System.IO.File]::ReadAllText($statusPath, [System.Text.Encoding]::UTF8)
$statusNeedle = "| 1 Objects/timing | $($ExpectedStatus -replace '_',' ') |"
Add-Check 'P01-STATE' $statusText.Contains($statusNeedle) "expected_row_fragment=$statusNeedle"
Add-Check 'P01-PHASE2-NOT-STARTED' $statusText.Contains('| 2 Demand/profit | NOT STARTED |') 'Phase 2 remains NOT STARTED'
Add-Check 'P01-SPEC-APPROVED' $statusText.Contains('Specification status: `APPROVED`') 'specification remains approved'

$tex = [System.IO.File]::ReadAllText($texPath, [System.Text.Encoding]::UTF8)
$symbols = [System.IO.File]::ReadAllText($symbolsPath, [System.Text.Encoding]::UTF8)
$dependency = [System.IO.File]::ReadAllText($dependencyPath, [System.Text.Encoding]::UTF8)
$assumptions = [System.IO.File]::ReadAllText($assumptionsPath, [System.Text.Encoding]::UTF8)
$issues = [System.IO.File]::ReadAllText($issuesPath, [System.Text.Encoding]::UTF8)

Add-Check 'P01-CANONICAL-X' $tex.Contains('original-drug innovation investment / project-advancement intensity') 'canonical v1.2 interpretation appears in TeX'
Add-Check 'P01-X-NOT-PATENTS' ($tex.Contains('it is not basic research') -and $tex.Contains('patent applications')) 'upstream/patent boundary stated'
Add-Check 'P01-PLAN-IDENTITY' $tex.Contains('\lambda_i^{\mathrm{plan}}=a_ix_i') 'planning-stage intensity identity present'
Add-Check 'P01-CLASS-NOTATION' ($tex.Contains('g\in\{O,\mathrm{Inc}\}') -and (-not $tex.Contains('g\in\{O,I\}'))) 'Inc classifier is distinct from internal route I'
$xigCount = ([regex]::Matches($tex, 'x_\{ig\}')).Count
Add-Check 'P01-COMMON-X' ($xigCount -eq 1 -and $tex.Contains('control \(x_{ig}\).')) "x_ig_count=$xigCount and occurrence is an explicit prohibition"
Add-Check 'P01-INSTITUTIONAL-WEDGE' ($tex.Contains('\tau_E(0)=+\infty') -and $tex.Contains('\tau_E(1)=\bar\tau_E<+\infty')) 'only entrusted-route institutional wedge defined'
Add-Check 'P01-ROUTE-DOMAIN' ($tex.Contains('\{I,T,A\}, & M=0') -and $tex.Contains('\{I,E,T,A\}, & M=1')) 'M=0 removes E and M=1 makes E available'
Add-Check 'P01-TIMING-STAGES' (([regex]::Matches($tex, '\\item\[Stage [0-5]\.\]')).Count -eq 6) 'Stages 0-5 all present exactly once'
Add-Check 'P01-ANTICIPATION-CHAIN' $tex.Contains('anticipated availability/value of }E') 'anticipated E-value channel present'
Add-Check 'P01-REALIZATION-CHAIN' $tex.Contains('observed holder--producer separation') 'later observed separation chain present'
Add-Check 'P01-S-INVARIANT' $tex.Contains('The reform does not shift \(s(q)\)') 'downstream probability MAH-invariant'

$forbiddenActivePatterns = @('\\eta', '\\operatorname\{logit\}', '\\log\s*\\sum', '\\max\s*\{', '\\arg\s*\\max', '\\pi\s*\(')
$forbiddenHits = [System.Collections.Generic.List[string]]::new()
foreach ($pattern in $forbiddenActivePatterns) {
    if ([regex]::IsMatch($tex, $pattern)) { $forbiddenHits.Add($pattern) }
}
Add-Check 'P01-NO-FORBIDDEN-ACTIVE-MECHANISM' ($forbiddenHits.Count -eq 0) "hits=$($forbiddenHits -join '; ')"

$allowedCategories = @(
    'primitive parameter',
    'exogenous firm characteristic',
    'exogenous project characteristic',
    'control',
    'endogenous firm-level object',
    'endogenous route-level object',
    'equilibrium price',
    'aggregate/distributional primitive',
    'derived observed outcome'
)
$registryStart = $symbols.IndexOf('## 3. Active Phase 1 object registry')
$registryEnd = $symbols.IndexOf('## 4. Definitional identities active in Phase 1')
$registryBlock = if ($registryStart -ge 0 -and $registryEnd -gt $registryStart) { $symbols.Substring($registryStart, $registryEnd - $registryStart) } else { '' }
$registryRows = @($registryBlock -split '\r?\n' | Where-Object { $_.StartsWith('|') -and (-not $_.StartsWith('|---')) -and (-not $_.StartsWith('| Symbol')) })
$objectRows = @($registryRows | ForEach-Object { ($_ -split '\|')[2].Trim() })
Add-Check 'P01-OBJECT-CATEGORY-COUNT' ($objectRows.Count -eq 27) "classified_active_rows=$($objectRows.Count)"
$badCategoryRows = @($objectRows | Where-Object { $allowedCategories -notcontains $_ })
Add-Check 'P01-OBJECT-CATEGORIES-EXACT' ($badCategoryRows.Count -eq 0) "invalid_categories=$($badCategoryRows -join '; ')"
Add-Check 'P01-DIMENSIONS' ($symbols.Contains('\mathsf{C}') -and $symbols.Contains('\mathsf{X}') -and $symbols.Contains('\mathsf{P}') -and $symbols.Contains('\mathsf{K}') -and $symbols.Contains('\mathsf{B}')) 'unit registry covers value, input, project, capability, and capacity units'
$controlChars = @($symbols.ToCharArray() + $dependency.ToCharArray() + $assumptions.ToCharArray() | Where-Object { ([int]$_ -lt 32) -and ([int]$_ -notin @(9,10,13)) })
Add-Check 'P01-MARKDOWN-ENCODING' ($controlChars.Count -eq 0 -and (-not $symbols.Contains([char]0xFFFD)) -and (-not $dependency.Contains([char]0xFFFD)) -and (-not $assumptions.Contains([char]0xFFFD))) "invalid_control_chars=$($controlChars.Count)"

$assumptionIds = @([regex]::Matches($assumptions, '`(A-P01-[A-Z]+-[0-9]{2})`') | ForEach-Object { $_.Groups[1].Value } | Sort-Object -Unique)
Add-Check 'P01-ASSUMPTION-IDS' ($assumptionIds.Count -eq 17) "unique_assumption_ids=$($assumptionIds.Count)"
Add-Check 'P01-NO-CONCLUSION-AS-ASSUMPTION' $assumptions.Contains('does not impose the signs of later propositions') 'assumption discipline stated'
Add-Check 'P01-DEPENDENCY-LEDGER' ($dependency.Contains('P01-E01') -and $dependency.Contains('P01-E07')) 'definition ledger P01-E01 through P01-E07 present'
Add-Check 'P01-FIXED-POINT-DECLARED' $dependency.Contains('future equilibrium loop is identified but not solved') 'p_m feedback declared and deferred to Phase 6'
Add-Check 'P01-FORBIDDEN-ARROWS' ($dependency.Contains('| $M\to a_i$') -and $dependency.Contains('observed holder-producer separation $\to x_i$')) 'forbidden-arrow table includes policy and timing reversals'

$labels = @([regex]::Matches($tex, '\\label\{([^}]+)\}') | ForEach-Object { $_.Groups[1].Value })
$uniqueLabels = @($labels | Sort-Object -Unique)
Add-Check 'P01-LABELS-UNIQUE' ($labels.Count -eq $uniqueLabels.Count) "labels=$($labels.Count) unique=$($uniqueLabels.Count)"
$refs = @([regex]::Matches($tex, '\\eqref\{([^}]+)\}') | ForEach-Object { $_.Groups[1].Value } | Sort-Object -Unique)
$undefinedRefs = @($refs | Where-Object { $uniqueLabels -notcontains $_ })
Add-Check 'P01-REFERENCES-DEFINED' ($undefinedRefs.Count -eq 0) "undefined=$($undefinedRefs -join '; ')"

$latexLog = if (Test-Path -LiteralPath $latexLogPath) { [System.IO.File]::ReadAllText($latexLogPath, [System.Text.Encoding]::UTF8) } else { '' }
$compileProblems = @('! LaTeX Error:', 'Fatal error occurred', 'There were undefined references', 'multiply defined', 'Overfull \hbox', 'Underfull \hbox') | Where-Object { $latexLog.Contains($_) }
Add-Check 'P01-LATEX-CLEAN' (@($compileProblems).Count -eq 0) "problems=$($compileProblems -join '; ')"
$consoleText = if (Test-Path -LiteralPath $consoleLogPath) { [System.IO.File]::ReadAllText($consoleLogPath, [System.Text.Encoding]::UTF8) } else { '' }
Add-Check 'P01-COMPILE-EVIDENCE' ($consoleText.Contains('Output written on') -and (Test-Path -LiteralPath $pdfPath)) "console=$consoleLogPath pdf=$pdfPath"

Add-Check 'P01-NO-P0-OPEN-ISSUE' (-not $issues.Contains('Severity now: `P0')) 'open issues contain no current P0 severity'

$allowedExact = @(
    'paper/model_notes/00_model_closure_status.md',
    'paper/model_notes/.gitattributes',
    'paper/model_notes/01_symbols_and_objects.md',
    'paper/model_notes/02_equation_dependency_map.md',
    'paper/model_notes/03_assumptions_and_scope.md',
    'paper/model_rebuild/.gitignore',
    'paper/model_rebuild/.gitattributes',
    'paper/model_rebuild/01_primitives_and_timing.tex',
    'paper/model_rebuild/audit/phase01_compile_console.txt',
    'paper/model_rebuild/audit/phase01_compile_wrapper.tex',
    'paper/model_rebuild/audit/phase01_preflight.md',
    'paper/model_rebuild/audit/phase01_gate_report.md',
    'paper/model_rebuild/audit/phase01_audit_results.json',
    'paper/model_rebuild/audit/phase01_artifact_hashes.md',
    'paper/model_rebuild/scripts/compile_phase01.ps1',
    'paper/model_rebuild/scripts/audit_phase01.ps1',
    'paper/model_rebuild/spec/instruction_traceability_matrix.csv',
    'paper/model_rebuild/spec/specification_hashes.md'
)
$unexpected = [System.Collections.Generic.List[string]]::new()
foreach ($line in @(& git -C $repoRoot status --porcelain=v1 --untracked-files=all)) {
    if ([string]::IsNullOrWhiteSpace($line)) { continue }
    $path = ($line.Substring(3).Trim('"') -replace '\\','/')
    if ($allowedExact -notcontains $path) { $unexpected.Add($line) }
}
Add-Check 'P01-WORKTREE-SCOPE' ($unexpected.Count -eq 0) "unexpected=$($unexpected -join '; ')"

$matrix = @(Import-Csv -LiteralPath $matrixPath -Encoding UTF8)
$p01d = @($matrix | Where-Object { $_.requirement_id -eq 'P01-D01' })
$p01g = @($matrix | Where-Object { $_.requirement_id -eq 'P01-G01' })
Add-Check 'P01-MATRIX-D01' ($p01d.Count -eq 1 -and $p01d[0].current_status -eq $ExpectedStatus) "status=$($p01d[0].current_status)"
Add-Check 'P01-MATRIX-G01' ($p01g.Count -eq 1 -and $p01g[0].current_status -eq $ExpectedStatus) "status=$($p01g[0].current_status)"

if ($ExpectedStatus -eq 'READY_FOR_APPROVAL') {
    $gateText = if (Test-Path -LiteralPath $gateReportPath) { [System.IO.File]::ReadAllText($gateReportPath, [System.Text.Encoding]::UTF8) } else { '' }
    $requiredGateIds = @('P01-D01','P01-G01','AMD12-01','RL-01','RL-28','QA-PROOF-01','QA-PROOF-10','QA-ECON-01','QA-ECON-08')
    $missingGateIds = @($requiredGateIds | Where-Object { -not $gateText.Contains($_) })
    Add-Check 'P01-GATE-REPORT-IDS' ($missingGateIds.Count -eq 0) "missing=$($missingGateIds -join '; ')"
    Add-Check 'P01-GATE-REPORT-PAUSE' ($gateText.Contains('READY FOR APPROVAL') -and $gateText.Contains('Phase 2')) 'gate report records mandatory pause before Phase 2'
}

$failed = @($checks | Where-Object { -not $_.passed })
$result = [pscustomobject]@{
    phase = 1
    expected_status = $ExpectedStatus
    status = if ($failed.Count -eq 0) { $ExpectedStatus } else { 'AUDIT_FAILED' }
    generated_at = (Get-Date).ToString('o')
    passed = $checks.Count - $failed.Count
    failed = $failed.Count
    checks = $checks
}
$json = $result | ConvertTo-Json -Depth 6
[System.IO.File]::WriteAllText($jsonPath, $json + [Environment]::NewLine, [System.Text.UTF8Encoding]::new($false))

foreach ($check in $checks) {
    $mark = if ($check.passed) { 'PASS' } else { 'FAIL' }
    Write-Output "[$mark] $($check.id): $($check.evidence)"
}
Write-Output "SUMMARY status=$($result.status) passed=$($result.passed) failed=$($result.failed) report=$jsonPath"

if ($failed.Count -gt 0) { exit 1 }
