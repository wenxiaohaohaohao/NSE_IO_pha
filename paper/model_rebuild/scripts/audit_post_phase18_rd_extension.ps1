param(
    [string]$OriginalCheckout = "D:\working_paper\DANNI",
    [string]$GuPdf = "D:\所有下载内容\ssrn-4770849 (1).pdf"
)

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$modelRoot = Split-Path -Parent $scriptDir
$paperRoot = Split-Path -Parent $modelRoot
$repoRoot = Split-Path -Parent $paperRoot
$script:failures = 0

function Add-Check {
    param([string]$Id, [bool]$Passed, [string]$Evidence)
    $status = if ($Passed) { "PASS" } else { "FAIL" }
    if (-not $Passed) { $script:failures++ }
    Write-Output ("{0}`t{1}`t{2}" -f $status, $Id, $Evidence)
}

function Read-Utf8([string]$RelativePath) {
    $path = Join-Path $repoRoot $RelativePath
    return [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)
}

$branch = (& git -C $repoRoot branch --show-current).Trim()
Add-Check "RD-BRANCH" ($branch -eq "codex/mah-model-rebuild") "branch=$branch"

$specPath = Join-Path $repoRoot "paper\model_rebuild\spec\MAH_model_rebuild_effective_spec_v1.2.md"
$specHash = (Get-FileHash -LiteralPath $specPath -Algorithm SHA256).Hash
Add-Check "RD-SPEC-HASH" ($specHash -eq "855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666") "sha256=$specHash"

$modulePath = Join-Path $repoRoot "paper\model_rebuild\15_research_development_patent_extension.tex"
Add-Check "RD-MODULE-EXISTS" (Test-Path -LiteralPath $modulePath) $modulePath
$module = Read-Utf8 "paper\model_rebuild\15_research_development_patent_extension.tex"

foreach ($required in @(
    '\label{eq:erd-objective}',
    '\label{eq:erd-kkt-research}',
    '\label{eq:erd-kkt-development}',
    '\label{eq:erd-kkt-budget}',
    '\label{eq:erd-kkt-nonnegative}',
    '\label{prop:erd-slack}',
    '\label{prop:erd-binding}',
    '\label{cor:erd-patent-sign}',
    '\label{eq:erd-cmo-demand}',
    '\label{eq:erd-equilibrium-value-gain}'
)) {
    Add-Check ("RD-REQUIRED-" + [Math]::Abs($required.GetHashCode())) ($module.Contains($required)) $required
}

$extensionPropCount = ([regex]::Matches($module, '\\begin\{extensionproposition\}')).Count
$extensionCorCount = ([regex]::Matches($module, '\\begin\{extensioncorollary\}')).Count
Add-Check "RD-PROPOSITION-COUNT" ($extensionPropCount -eq 2) "count=$extensionPropCount"
Add-Check "RD-COROLLARY-COUNT" ($extensionCorCount -eq 1) "count=$extensionCorCount"

Add-Check "RD-CONCAVITY" ($module.Contains('\kappa_{Ri}\kappa_{Di}-(t_i\gamma_i)^2')) "negative-definite Hessian determinant"
Add-Check "RD-BINDING-SIGN-CONDITION" ($module.Contains('a_i>\gamma_i(x_i^{D,b}-x_i^{R,b})')) "development-biased sufficient condition"
Add-Check "RD-PATENT-MAPPING" ($module.Contains('P_i^A=h_i(x_i^R)') -and $module.Contains("h_i'(x_i^R)>0")) "patent production and monotonicity"
Add-Check "RD-FINITE-BINARY-POLICY" ($module.Contains('finite equilibrium value comparison') -and -not $module.Contains('\partial M')) "no derivative with respect to binary M"
Add-Check "RD-REGIME-SWITCH" ($module.Contains('differentiate through the kink') -and $module.Contains('finite comparison')) "piecewise KKT boundary recorded"
Add-Check "RD-GU-BOUNDARY" ($module.Contains('\citet{Gu2024}') -and $module.Contains('directly reveal \(\varpi_i\)')) "resource proxy does not identify KKT multiplier"

$main = Read-Utf8 "paper\manuscript\mah_route_indicator_friction_model.tex"
$appendix = Read-Utf8 "paper\manuscript\mah_route_indicator_friction_model_appendix.tex"
Add-Check "RD-MAIN-SECTION" ($main.Contains('\section{Extension: Research--Development Allocation and Patenting}')) "main extension section"
Add-Check "RD-APPENDIX-INPUT" ($appendix.Contains('\input{../model_rebuild/15_research_development_patent_extension.tex}')) "appendix imports formal extension"
Add-Check "RD-THEOREM-ENVIRONMENTS" ($appendix.Contains('\newtheorem{extensionproposition}') -and $appendix.Contains('\newtheorem{extensioncorollary}')) "separate extension numbering"

$modelStart = $main.IndexOf('\section{Model}')
$extensionStart = $main.IndexOf('\section{Extension: Research--Development Allocation and Patenting}')
$baselineModel = $main.Substring($modelStart, $extensionStart - $modelStart)
Add-Check "RD-BASELINE-CONTROL-ISOLATION" (-not $baselineModel.Contains('x_i^R') -and -not $baselineModel.Contains('x_i^D') -and -not $baselineModel.Contains('\bar X_i')) "baseline model section contains no extension control or resource ceiling"

$equilibrium = Read-Utf8 "paper\model_rebuild\07_equilibrium_definition.tex"
$baselineAdvancement = Read-Utf8 "paper\model_rebuild\05_rd_problem.tex"
Add-Check "RD-BASELINE-EQUILIBRIUM-UNCHANGED" (-not $equilibrium.Contains('x_i^R') -and -not $equilibrium.Contains('x_i^D') -and -not $equilibrium.Contains('P_i^A')) "baseline equilibrium set unchanged"
Add-Check "RD-BASELINE-ADVANCEMENT-UNCHANGED" (-not $baselineAdvancement.Contains('x_i^R') -and -not $baselineAdvancement.Contains('x_i^D') -and -not $baselineAdvancement.Contains('P_i^A')) "baseline one-control problem unchanged"

function Test-UniqueLabels([string[]]$Texts) {
    $labels = foreach ($text in $Texts) {
        foreach ($match in [regex]::Matches($text, '\\label\{([^}]+)\}')) {
            $match.Groups[1].Value
        }
    }
    return @(($labels | Group-Object | Where-Object Count -gt 1)).Count -eq 0
}

Add-Check "RD-MAIN-LABELS-UNIQUE" (Test-UniqueLabels @($main)) "main-document labels"
$appendixInputs = @(
    $appendix,
    (Read-Utf8 "paper\model_rebuild\01_primitives_and_timing.tex"),
    (Read-Utf8 "paper\model_rebuild\02_demand_profit_derivation.tex"),
    (Read-Utf8 "paper\model_rebuild\03_internal_external_technologies.tex"),
    (Read-Utf8 "paper\model_rebuild\04_route_values_and_sorting.tex"),
    (Read-Utf8 "paper\model_rebuild\05_rd_problem.tex"),
    (Read-Utf8 "paper\model_rebuild\06_cmo_supply_demand_equilibrium.tex"),
    (Read-Utf8 "paper\model_rebuild\07_equilibrium_definition.tex"),
    (Read-Utf8 "paper\model_rebuild\08_required_propositions.tex"),
    (Read-Utf8 "paper\model_rebuild\08_comparative_statics.tex"),
    (Read-Utf8 "paper\model_rebuild\09_observed_outcomes.tex"),
    (Read-Utf8 "paper\model_rebuild\11_extensions_not_baseline.tex"),
    $module
)
Add-Check "RD-APPENDIX-LABELS-UNIQUE" (Test-UniqueLabels $appendixInputs) "appendix wrapper plus imported modules"

foreach ($baseName in @('mah_route_indicator_friction_model','mah_route_indicator_friction_model_appendix')) {
    $logPath = Join-Path $paperRoot "build\$baseName\$baseName.log"
    $pdfPath = Join-Path $paperRoot "output\$baseName.pdf"
    Add-Check "RD-PDF-$baseName" (Test-Path -LiteralPath $pdfPath) $pdfPath
    if (Test-Path -LiteralPath $logPath) {
        $log = [System.IO.File]::ReadAllText($logPath, [System.Text.Encoding]::Default)
        $bad = $log -match 'undefined references|There were undefined|multiply defined|LaTeX Error|Fatal error|Overfull \\hbox|Underfull \\hbox'
        Add-Check "RD-LOG-$baseName" (-not $bad) "final log has no targeted error/warning"
    }
    else {
        Add-Check "RD-LOG-$baseName" $false "missing log=$logPath"
    }
}

if (Test-Path -LiteralPath $GuPdf) {
    $guHash = (Get-FileHash -LiteralPath $GuPdf -Algorithm SHA256).Hash
    Add-Check "RD-GU-PDF-HASH" ($guHash -eq "A13D5D1D3DE3A0E4E0D15D5DBF428F2F395C9B95E960C7B3C97652CBC8D9EAEB") "sha256=$guHash"
}
else {
    Add-Check "RD-GU-PDF-HASH" $false "missing=$GuPdf"
}

$originalStatus = @(& git -C $OriginalCheckout status --short)
$expectedDirty = @(' M paper/collaboration/MAH_model_update_20260717.zip')
$originalCleanExceptZip = ($originalStatus.Count -eq 1 -and $originalStatus[0] -eq $expectedDirty[0])
Add-Check "RD-ORIGINAL-CHECKOUT-ISOLATION" $originalCleanExceptZip ("status=" + ($originalStatus -join ';'))

if ($script:failures -gt 0) {
    throw "Post-Phase-18 R&D extension audit failed: $script:failures check(s)."
}

Write-Output "POST_PHASE18_RD_EXTENSION_AUDIT=PASS"
