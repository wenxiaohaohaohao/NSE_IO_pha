param(
    [string]$RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\..\.."))
)

$ErrorActionPreference = "Stop"
$failures = [System.Collections.Generic.List[string]]::new()
$passes = [System.Collections.Generic.List[string]]::new()

function Add-Check {
    param([string]$Name, [bool]$Passed, [string]$Evidence)
    if ($Passed) {
        $passes.Add("PASS`t$Name`t$Evidence")
    }
    else {
        $failures.Add("FAIL`t$Name`t$Evidence")
    }
}

function Read-Utf8 {
    param([string]$Path)
    return [System.IO.File]::ReadAllText($Path, [System.Text.Encoding]::UTF8)
}

$paper = Join-Path $RepoRoot "paper"
$main = Join-Path $paper "manuscript\mah_route_indicator_friction_model.tex"
$appendix = Join-Path $paper "manuscript\mah_route_indicator_friction_model_appendix.tex"
$bib = Join-Path $paper "manuscript\mah_route_indicator_friction_refs.bib"
$note = Join-Path $paper "model_rebuild\spec\source\MAH_financing_friction_codex_notes.md"
$mainLog = Join-Path $paper "build\mah_route_indicator_friction_model\mah_route_indicator_friction_model.log"
$appendixLog = Join-Path $paper "build\mah_route_indicator_friction_model_appendix\mah_route_indicator_friction_model_appendix.log"
$mainPdf = Join-Path $paper "output\mah_route_indicator_friction_model.pdf"
$appendixPdf = Join-Path $paper "output\mah_route_indicator_friction_model_appendix.pdf"

foreach ($required in @($main,$appendix,$bib,$note,$mainLog,$appendixLog,$mainPdf,$appendixPdf)) {
    Add-Check "required-file" (Test-Path -LiteralPath $required) $required
}

$expectedNoteHash = "C139AE0B795A26851573438891F3CA30AABF46832B3CF97B22FF19138C4B61F9"
$actualNoteHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $note).Hash
Add-Check "frozen-financing-note-hash" ($actualNoteHash -eq $expectedNoteHash) $actualNoteHash

$mainText = Read-Utf8 $main
$appendixText = Read-Utf8 $appendix
$bibText = Read-Utf8 $bib

Add-Check "title" ($mainText.Contains("Regulatory Separation and Pharmaceutical Innovation: Evidence from China's MAH Reform")) "main title"
Add-Check "main-four-propositions" (([regex]::Matches($mainText, '\\begin\{proposition\}')).Count -eq 4) "count=$(([regex]::Matches($mainText, '\\begin\{proposition\}')).Count)"
Add-Check "developer-type" ($mainText.Contains("\theta_i=(a_i,k_i,\ell_i)")) "theta includes ell"
Add-Check "joint-distribution" ($mainText.Contains("H(a,k,\ell)")) "H(a,k,ell)"
Add-Check "internal-financing" ($mainText.Contains("J_I(m,k_i)") -and $mainText.Contains("J_{I,k}<0")) "J_I and signs"
Add-Check "entrusted-financing" ($mainText.Contains("J_E(m)") -and $mainText.Contains("J_E'(m)>0")) "J_E and sign"
Add-Check "finance-adjusted-values" ($mainText.Contains("\widetilde W_i^I") -and $mainText.Contains("\widetilde W_i^E")) "tilde values"
Add-Check "financing-corridor" ($mainText.Contains("J_E(m)\leq\ell_i<J_I(m,k_i)")) "corridor inequality"
Add-Check "one-control" ($mainText.Contains("\max_{x_i\geq0}") -and -not $mainText.Contains("x_i^R")) "one common x_i"
Add-Check "no-binding-nesting" ($mainText.Contains("No-binding-finance limit")) "explicit nesting paragraph"
Add-Check "literature-entries" ($bibText.Contains("GrossmanHelpman2002") -and $bibText.Contains("BolerMoxnesUlltveitMoe2015") -and $bibText.Contains("Ma2026") -and $bibText.Contains("HallLerner2010")) "four verified entries"

$moduleFiles = @(
    (Join-Path $paper "model_rebuild\01_primitives_and_timing.tex"),
    (Join-Path $paper "model_rebuild\02_demand_profit_derivation.tex"),
    (Join-Path $paper "model_rebuild\03_internal_external_technologies.tex"),
    (Join-Path $paper "model_rebuild\04_route_values_and_sorting.tex"),
    (Join-Path $paper "model_rebuild\05_rd_problem.tex"),
    (Join-Path $paper "model_rebuild\06_cmo_supply_demand_equilibrium.tex"),
    (Join-Path $paper "model_rebuild\07_equilibrium_definition.tex"),
    (Join-Path $paper "model_rebuild\08_required_propositions.tex"),
    (Join-Path $paper "model_rebuild\08_comparative_statics.tex"),
    (Join-Path $paper "model_rebuild\09_observed_outcomes.tex"),
    (Join-Path $paper "model_rebuild\10_empirical_mapping.tex")
)
$activeFiles = @($main,$appendix) + $moduleFiles + @(
    (Join-Path $paper "model_rebuild\13_main_text_model_candidate.tex"),
    (Join-Path $paper "model_rebuild\14_appendix_model_candidate.tex")
)
$activeText = ($activeFiles | ForEach-Object { Read-Utf8 $_ }) -join "`n"

Add-Check "no-hard-capability-cutoff" (-not [regex]::IsMatch($activeText, '\\underline\{k\}|F_I[^\r\n]*(=|\\Rightarrow)[^\r\n]*\+\\infty')) "active sources"
Add-Check "no-active-rd-patent-control" (-not [regex]::IsMatch($activeText, 'x_i\^R|x_i\^D|P_i\^A|\\bar X_i')) "active sources"
Add-Check "no-superseded-input" (-not $appendixText.Contains("15_research_development_patent_extension")) "appendix driver"
Add-Check "J-not-subtracted" (-not [regex]::IsMatch($activeText, '-\s*J_[IE]')) "liquidity requirements never enter payoff subtraction"
Add-Check "no-credit-supply-claim" (-not [regex]::IsMatch($mainText, 'MAH (relaxes|increases|expands) (the )?(financing|credit)')) "main manuscript"

function Check-Labels {
    param([string]$Name, [string]$Text)
    $labels = [regex]::Matches($Text, '\\label\{([^}]+)\}') | ForEach-Object { $_.Groups[1].Value }
    $duplicates = $labels | Group-Object | Where-Object Count -gt 1
    Add-Check "$Name-label-uniqueness" ($duplicates.Count -eq 0) (($duplicates | ForEach-Object Name) -join ',')
}

Check-Labels "main" $mainText
$appendixModuleFiles = $moduleFiles | Where-Object { $_ -notlike "*\10_empirical_mapping.tex" }
$appendixModuleFiles += (Join-Path $paper "model_rebuild\11_extensions_not_baseline.tex")
$appendixExpanded = $appendixText + "`n" + (($appendixModuleFiles | ForEach-Object { Read-Utf8 $_ }) -join "`n")
Check-Labels "appendix-active-modules" $appendixExpanded

foreach ($logPath in @($mainLog,$appendixLog)) {
    $logText = Read-Utf8 $logPath
    $bad = [regex]::IsMatch($logText, 'LaTeX Warning: (There were undefined references|Label\(s\) may have changed)|Citation .* undefined|multiply defined|Overfull \\hbox|Emergency stop|Fatal error|^!', [System.Text.RegularExpressions.RegexOptions]::Multiline)
    Add-Check "clean-latex-log" (-not $bad) $logPath
}

foreach ($line in $passes) { Write-Output $line }
foreach ($line in $failures) { Write-Output $line }

if ($failures.Count -gt 0) {
    Write-Output "POST_PHASE18_FINANCING_REVISION_AUDIT=FAIL"
    exit 1
}

Write-Output "POST_PHASE18_FINANCING_REVISION_AUDIT=PASS"
