[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$modelRebuild = Split-Path -Parent $PSScriptRoot
$paperRoot = Split-Path -Parent $modelRebuild
$repoRoot = Split-Path -Parent $paperRoot
$outputPath = Join-Path $modelRebuild 'audit\phase12_legacy_occurrence_index.csv'

$sourceFiles = @(
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

$objects = @(
    [pscustomobject]@{ Id='CW-01'; Name='R_event'; Pattern='R(?:_i)?\^\{event\}|R\^\{event\}_\{it\}' },
    [pscustomobject]@{ Id='CW-02'; Name='Rbar_E'; Pattern='\\bar R(?:_i)?\^E|\\bar R\^E' },
    [pscustomobject]@{ Id='CW-03'; Name='retained_continuation_v'; Pattern='continuation value|retained-stock|retained stock|\+v(?:_\{t\+1\}|_t)?|\+ v(?:_\{t\+1\}|_t)?' },
    [pscustomobject]@{ Id='CW-04'; Name='C_internal'; Pattern='C\^I\(k_i\)|C_k\^I|C_i\^I' },
    [pscustomobject]@{ Id='CW-05'; Name='h_internal'; Pattern='h_i\^I' },
    [pscustomobject]@{ Id='CW-06'; Name='q_external'; Pattern='q_i\^E' },
    [pscustomobject]@{ Id='CW-07'; Name='mu_external'; Pattern='\\mu_i\^E|\\mu\^E|mu_i\^E' },
    [pscustomobject]@{ Id='CW-08'; Name='binary_M'; Pattern='M\\in\\\{0,1\\\}|M\s*\\in\s*\\\{0,1\\\}|binary reform|route-set expansion' },
    [pscustomobject]@{ Id='CW-09'; Name='continuous_eta'; Pattern='\\eta' },
    [pscustomobject]@{ Id='CW-10'; Name='route_realization_zeta'; Pattern='\\zeta' },
    [pscustomobject]@{ Id='CW-11'; Name='logit_route_choice'; Pattern='logit|Type-I extreme value|\\sigma_r' },
    [pscustomobject]@{ Id='CW-12'; Name='inclusive_value_Gamma'; Pattern='inclusive value|\\Gamma' },
    [pscustomobject]@{ Id='CW-13'; Name='Delta_Gamma_set'; Pattern='\\Delta\\Gamma|prop:set_expansion|eq:set_expansion' },
    [pscustomobject]@{ Id='CW-14'; Name='quadratic_effort_cost'; Pattern='quadratic R|\\frac\{\\kappa\}\{2\}x|\\kappa x_i|\\kappa x_\{it\}' },
    [pscustomobject]@{ Id='CW-15'; Name='old_x_star_formula'; Pattern='eq:xstar|x_i\^\*\(M,\\eta\)|x_i\^\*.*\\frac\{\\beta a_i\}' },
    [pscustomobject]@{ Id='CW-16'; Name='CMO_market'; Pattern='CMO|contract-manufacturing|qualified support' },
    [pscustomobject]@{ Id='CW-17'; Name='planning_observed_boundary'; Pattern='planning-stage|planning stage|observed outcome|observed retained|holder--producer' },
    [pscustomobject]@{ Id='CW-18'; Name='transfer_route'; Pattern='transfer route|out-licens|G_i\^T|W\^T|\\tau_i\^T' },
    [pscustomobject]@{ Id='CW-19'; Name='entry'; Pattern='entry|entrant|F_e|N_E' },
    [pscustomobject]@{ Id='CW-20'; Name='x_semantics'; Pattern='R\\&D effort|R&D effort|R\\&D intensity|original-drug R\\&D' },
    [pscustomobject]@{ Id='CW-21'; Name='innovation_arrival'; Pattern='project arrival|project-arrival|arrival rate|\\lambda_i\^\{plan|Poisson' },
    [pscustomobject]@{ Id='CW-22'; Name='patent_outcome'; Pattern='patent|Patent' },
    [pscustomobject]@{ Id='CW-23'; Name='original_innovation_claim'; Pattern='original-drug innovation|original innovation' },
    [pscustomobject]@{ Id='CW-24'; Name='novelty_classes'; Pattern='incremental|novelty class|novelty composition|original versus' }
)

$rows = [Collections.Generic.List[object]]::new()
foreach ($relativePath in $sourceFiles) {
    $fullPath = Join-Path $repoRoot $relativePath
    if (-not (Test-Path -LiteralPath $fullPath -PathType Leaf)) {
        throw "Missing legacy source: $relativePath"
    }
    $lines = [IO.File]::ReadAllLines($fullPath, [Text.Encoding]::UTF8)
    $rolesByLine = [object[]]::new($lines.Length)
    $labelsByLine = [object[]]::new($lines.Length)
    for ($unused = 0; $unused -lt $lines.Length; $unused++) {
        $rolesByLine[$unused] = [Collections.Generic.List[string]]::new()
        $labelsByLine[$unused] = [Collections.Generic.List[string]]::new()
    }
    foreach ($block in @(
        [pscustomobject]@{ Role='equation'; Begin='\\begin\{(?:equation|align|gather|multline)\*?\}'; End='\\end\{(?:equation|align|gather|multline)\*?\}' },
        [pscustomobject]@{ Role='proposition'; Begin='\\begin\{(?:proposition|lemma|corollary)\}'; End='\\end\{(?:proposition|lemma|corollary)\}' }
    )) {
        $cursor = 0
        while ($cursor -lt $lines.Length) {
            while ($cursor -lt $lines.Length -and $lines[$cursor] -notmatch $block.Begin) { $cursor++ }
            if ($cursor -ge $lines.Length) { break }
            $start = $cursor
            while ($cursor -lt $lines.Length -and $lines[$cursor] -notmatch $block.End) { $cursor++ }
            if ($cursor -ge $lines.Length) { throw "Unclosed $($block.Role) block in $relativePath at line $($start + 1)" }
            $end = $cursor
            $blockLabels = [Collections.Generic.List[string]]::new()
            foreach ($candidate in $lines[$start..$end]) {
                foreach ($match in [regex]::Matches($candidate, '\\label\{([^}]+)\}')) {
                    $blockLabels.Add($match.Groups[1].Value)
                }
            }
            foreach ($position in $start..$end) {
                $rolesByLine[$position].Add($block.Role)
                foreach ($label in $blockLabels) { $labelsByLine[$position].Add($label) }
            }
            $cursor++
        }
    }
    for ($lineIndex = 0; $lineIndex -lt $lines.Length; $lineIndex++) {
        $line = $lines[$lineIndex]
        foreach ($object in $objects) {
            if (-not [regex]::IsMatch($line, $object.Pattern, [Text.RegularExpressions.RegexOptions]::IgnoreCase)) { continue }
            $roles = [Collections.Generic.List[string]]::new()
            if ($relativePath -like '*appendix.tex') { $roles.Add('appendix') }
            if ($relativePath -like 'research_notes/*') { $roles.Add('legacy-note') }
            foreach ($role in $rolesByLine[$lineIndex]) { $roles.Add($role) }
            $isCalibration =
                ($relativePath -match 'calibration') -or
                ($relativePath -like '*mah_route_indicator_friction_model.tex' -and $lineIndex + 1 -ge 338) -or
                ($relativePath -like '*appendix.tex' -and $lineIndex + 1 -ge 828)
            if ($isCalibration) { $roles.Add('calibration-or-empirical') }
            if ($rolesByLine[$lineIndex].Count -eq 0 -and $relativePath -notlike 'research_notes/*') { $roles.Add('narrative-paragraph') }
            $rows.Add([pscustomobject]@{
                object_id = $object.Id
                legacy_object = $object.Name
                source_file = $relativePath.Replace('\','/')
                line = $lineIndex + 1
                context_kind = (($roles | Sort-Object -Unique) -join ';')
                enclosing_labels = (($labelsByLine[$lineIndex] | Sort-Object -Unique) -join ';')
                text = $line.Trim()
            })
        }
    }
}

$rows |
    Sort-Object object_id, source_file, line |
    Export-Csv -LiteralPath $outputPath -NoTypeInformation -Encoding utf8

$csvText = [IO.File]::ReadAllText($outputPath,[Text.Encoding]::UTF8)
$csvText = $csvText.Replace([Environment]::NewLine,[string][char]10)
$csvText = $csvText.Replace([string][char]13,[string][char]10)
[IO.File]::WriteAllText($outputPath,$csvText,[Text.UTF8Encoding]::new($false))

Write-Output "PHASE12_LEGACY_INDEX=PASS rows=$($rows.Count) output=$outputPath"
