[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$modelRoot = Split-Path -Parent $PSScriptRoot
$paperRoot = Split-Path -Parent $modelRoot
$repoRoot = Split-Path -Parent $paperRoot
$manuscriptRoot = Join-Path $paperRoot 'manuscript'
$outputRoot = Join-Path $paperRoot 'output'
$buildRoot = Join-Path $paperRoot 'build'
$auditRoot = Join-Path $modelRoot 'audit'
$sourceRoot = Join-Path $modelRoot 'spec\source'
$notesRoot = Join-Path $paperRoot 'model_notes\baseline_recenter'

$checks = [Collections.Generic.List[object]]::new()
function Add-Check([string]$Id,[bool]$Passed,[string]$Evidence) {
  $checks.Add([pscustomobject]@{id=$Id;passed=$Passed;evidence=$Evidence})
}
function Read-Utf8([string]$Path) {
  [IO.File]::ReadAllText($Path,[Text.Encoding]::UTF8)
}

$main = Join-Path $manuscriptRoot 'mah_route_indicator_friction_model.tex'
$appendix = Join-Path $manuscriptRoot 'mah_route_indicator_friction_model_appendix.tex'
$bib = Join-Path $manuscriptRoot 'mah_route_indicator_friction_refs.bib'
$mainPdf = Join-Path $outputRoot 'mah_route_indicator_friction_model.pdf'
$appendixPdf = Join-Path $outputRoot 'mah_route_indicator_friction_model_appendix.pdf'
$mainLog = Join-Path $buildRoot 'mah_route_indicator_friction_model\mah_route_indicator_friction_model.log'
$appendixLog = Join-Path $buildRoot 'mah_route_indicator_friction_model_appendix\mah_route_indicator_friction_model_appendix.log'
$note = Join-Path $sourceRoot 'MAH_recenter_financing_extension_codex_notes.md'
$extension = Join-Path $modelRoot '15_financing_commercialization_extension.tex'

$baselineNames = @(
  '01_primitives_and_timing.tex','02_demand_profit_derivation.tex',
  '03_internal_external_technologies.tex','04_route_values_and_sorting.tex',
  '05_rd_problem.tex','06_cmo_supply_demand_equilibrium.tex',
  '07_equilibrium_definition.tex','08_required_propositions.tex',
  '08_comparative_statics.tex','09_observed_outcomes.tex',
  '10_empirical_mapping.tex','13_main_text_model_candidate.tex'
)
$baselineFiles = @($main) + @($baselineNames | ForEach-Object { Join-Path $modelRoot $_ })
$required = @($main,$appendix,$bib,$mainPdf,$appendixPdf,$mainLog,$appendixLog,$note,$extension)
$required += 0..6 | ForEach-Object { Join-Path $notesRoot (('{0:d2}' -f $_) + '_' + @('decision_and_scope','baseline_state_cleanup','internal_cost_reinterpretation','proposition_rebuild','cmo_equilibrium_audit','finance_extension_isolation','empirical_promotion_criteria')[$_] + '.md') }
$required += @(
  (Join-Path $auditRoot 'post_phase18_recenter_change_log_20260904.md'),
  (Join-Path $auditRoot 'post_phase18_recenter_notation_audit.md'),
  (Join-Path $auditRoot 'finance_baseline_vs_recentered_comparison.md'),
  (Join-Path $auditRoot 'post_phase18_recenter_pdf_render_audit.md'),
  (Join-Path $auditRoot 'post_phase18_recenter_artifact_hashes.md'),
  (Join-Path $auditRoot 'post_phase18_recenter_audit_20260904.md')
)
foreach ($path in $required) { Add-Check 'required-file' (Test-Path -LiteralPath $path -PathType Leaf) $path }

$hash = if (Test-Path $note) { (Get-FileHash -Algorithm SHA256 -LiteralPath $note).Hash } else { 'MISSING' }
Add-Check 'frozen-recenter-note' ($hash -eq '78FE720E4BEEE624FFF3DDF0E1D51CD7FE773178BBE4740E7951B39DDDD0E45E') $hash

$mainText = Read-Utf8 $main
$appendixText = Read-Utf8 $appendix
$baselineText = ($baselineFiles | ForEach-Object { Read-Utf8 $_ }) -join "`n"
$extensionText = Read-Utf8 $extension

Add-Check 'official-title' $mainText.Contains("Regulatory Separation and Pharmaceutical Innovation: Evidence from China's MAH Reform") 'main title'
$mainPropCount = [regex]::Matches($mainText,'\\begin\{proposition\}').Count
Add-Check 'main-four-propositions' ($mainPropCount -eq 4) "count=$mainPropCount"
Add-Check 'baseline-type' ($mainText.Contains('\theta_i=(a_i,k_i)\sim H(a,k)')) 'theta and H'
Add-Check 'ordinary-route-values' ($mainText.Contains('\max\{W_i^I,W_i^E,W^T,W^A\}')) 'ordinary deterministic maximum'
Add-Check 'one-common-x' ($mainText.Contains('\max_{x_i\geq0}') -and -not $mainText.Contains('x_i^R') -and -not $mainText.Contains('x_i^D')) 'one advancement control'
Add-Check 'cmo-H-ak' ($mainText.Contains('dH(a,k)')) 'baseline CMO aggregation'

foreach ($pattern in @('\\ell_i','J_I','J_E','\\widetilde','H\(a,k,\\ell\)','x_i\^R','x_i\^D','P_i\^A','\\bar X_i','\\varpi_i')) {
  $count = [regex]::Matches($baselineText,$pattern).Count
  Add-Check ('baseline-forbidden-'+$pattern.GetHashCode().ToString('X8')) ($count -eq 0) "pattern=$pattern count=$count"
}
$underlineCount = [regex]::Matches($baselineText,'\\underline\{k\}').Count
$hardRuleCount = [regex]::Matches($baselineText,'k_i\s*<\s*\\underline|F_I\(m,k_i\)\s*=\s*\+?\\infty').Count
Add-Check 'no-hard-capability-cutoff' ($underlineCount -eq 0 -and $hardRuleCount -eq 0) "underline=$underlineCount hard_rules=$hardRuleCount"
Add-Check 'finite-positive-k-costs' ($baselineText.Contains('0\leq F_I(m,k_i)<+\infty') -or $baselineText.Contains('0\leq F_I(m,k_i)<\infty')) 'finite setup cost statement'
Add-Check 'sorting-derivative' ($baselineText.Contains('R_c(q,c_I)c_{I,k}') -and $baselineText.Contains('-F_{I,k}')) 'single crossing retained'

Add-Check 'extension-explicitly-inactive' ($extensionText.Contains('\textbf{Not part of the baseline.}')) 'extension label'
Add-Check 'extension-symbols-preserved' ($extensionText.Contains('\ell_i') -and $extensionText.Contains('J_I(m,k_i)') -and $extensionText.Contains('J_E(m)')) 'finance objects'
Add-Check 'extension-accounting' ([regex]::IsMatch($extensionText,'never subtracted from\s+payoffs')) 'liquidity is not cost'
Add-Check 'extension-nesting' ($extensionText.Contains('\ell_i\geq\max\{J_I(m,k_i),J_E(m)\}') -and $extensionText.Contains('\widetilde W_i^I=W_i^I')) 'no-binding finance nesting'
Add-Check 'appendix-extension-order' ($appendixText.IndexOf('11_extensions_not_baseline.tex') -ge 0 -and $appendixText.IndexOf('15_financing_commercialization_extension.tex') -gt $appendixText.IndexOf('11_extensions_not_baseline.tex')) 'extension follows quarantine'
Add-Check 'archived-rd-not-imported' (-not $appendixText.Contains('15_research_development_patent_extension')) 'appendix driver'

function Check-Log([string]$Name,[string]$Path) {
  $text = Read-Utf8 $Path
  $bad = [regex]::IsMatch($text,'LaTeX Warning: (There were undefined references|Label\(s\) may have changed)|Citation .* undefined|multiply defined|Overfull \\hbox|Underfull \\hbox|Emergency stop|Fatal error|^!',[Text.RegularExpressions.RegexOptions]::Multiline)
  Add-Check $Name (-not $bad) $Path
}
Check-Log 'main-log-clean' $mainLog
Check-Log 'appendix-log-clean' $appendixLog
Add-Check 'main-pdf-nonempty' ((Get-Item $mainPdf).Length -gt 100000) "bytes=$((Get-Item $mainPdf).Length)"
Add-Check 'appendix-pdf-nonempty' ((Get-Item $appendixPdf).Length -gt 100000) "bytes=$((Get-Item $appendixPdf).Length)"

$mainLabels = [regex]::Matches($mainText,'\\label\{([^}]+)\}') | ForEach-Object { $_.Groups[1].Value }
$mainDup = @($mainLabels | Group-Object | Where-Object Count -gt 1)
Add-Check 'main-labels-unique' ($mainDup.Count -eq 0) (($mainDup | ForEach-Object Name) -join ',')
$appendixExpanded = $appendixText + "`n" + ((@('01_primitives_and_timing.tex','02_demand_profit_derivation.tex','03_internal_external_technologies.tex','04_route_values_and_sorting.tex','05_rd_problem.tex','06_cmo_supply_demand_equilibrium.tex','07_equilibrium_definition.tex','08_required_propositions.tex','08_comparative_statics.tex','09_observed_outcomes.tex','11_extensions_not_baseline.tex','15_financing_commercialization_extension.tex') | ForEach-Object { Read-Utf8 (Join-Path $modelRoot $_) }) -join "`n")
$appendixLabels = [regex]::Matches($appendixExpanded,'\\label\{([^}]+)\}') | ForEach-Object { $_.Groups[1].Value }
$appendixDup = @($appendixLabels | Group-Object | Where-Object Count -gt 1)
Add-Check 'appendix-labels-unique' ($appendixDup.Count -eq 0) (($appendixDup | ForEach-Object Name) -join ',')

$zipStatus = @(& git -C $repoRoot status --porcelain=v1 -- paper/collaboration/MAH_model_update_20260717.zip)
Add-Check 'original-zip-isolated' ($zipStatus.Count -eq 0) "count=$($zipStatus.Count)"
$archiveRoot = Join-Path $modelRoot 'archive\finance_baseline_2026_09_03'
foreach ($name in @('mah_route_indicator_friction_model.tex','mah_route_indicator_friction_model.pdf','mah_route_indicator_friction_model_appendix.tex','mah_route_indicator_friction_model_appendix.pdf','mah_route_indicator_friction_refs.bib','BACKUP_MANIFEST.md')) {
  Add-Check 'archive-file' (Test-Path -LiteralPath (Join-Path $archiveRoot $name) -PathType Leaf) $name
}

$failed = @($checks | Where-Object { -not $_.passed })
foreach ($check in $checks) {
  $state = if ($check.passed) { 'PASS' } else { 'FAIL' }
  Write-Output "$state`t$($check.id)`t$($check.evidence)"
}
if ($failed.Count -gt 0) {
  Write-Output "POST_PHASE18_RECENTER_AUDIT=FAIL failed=$($failed.Count) total=$($checks.Count)"
  exit 1
}
Write-Output "POST_PHASE18_RECENTER_AUDIT=PASS failed=0 total=$($checks.Count)"
