[CmdletBinding()]
param(
  [Parameter(Mandatory=$true)]
  [ValidateSet('IN_PROGRESS','READY_FOR_APPROVAL','APPROVED')]
  [string]$ExpectedStatus
)

Set-StrictMode -Version Latest
$ErrorActionPreference='Stop'

$modelRebuild=Split-Path -Parent $PSScriptRoot
$paperRoot=Split-Path -Parent $modelRebuild
$repoRoot=Split-Path -Parent $paperRoot
$auditRoot=Join-Path $modelRebuild 'audit'
$specRoot=Join-Path $modelRebuild 'spec'
$sourceRoot=Join-Path $specRoot 'source'
$notesRoot=Join-Path $paperRoot 'model_notes'
$manuscriptRoot=Join-Path $paperRoot 'manuscript'
$outputRoot=Join-Path $paperRoot 'output'
$backupRoot=Join-Path $modelRebuild 'backups\phase18_preintegration'

$statusPath=Join-Path $notesRoot '00_model_closure_status.md'
$openIssuesPath=Join-Path $notesRoot '06_open_issues_log.md'
$matrixPath=Join-Path $specRoot 'instruction_traceability_matrix.csv'
$mainPath=Join-Path $manuscriptRoot 'mah_route_indicator_friction_model.tex'
$appendixPath=Join-Path $manuscriptRoot 'mah_route_indicator_friction_model_appendix.tex'
$bibPath=Join-Path $manuscriptRoot 'mah_route_indicator_friction_refs.bib'
$memoPath=Join-Path $manuscriptRoot 'mah_route_indicator_friction_model_technical_memo.tex'
$mainPdf=Join-Path $outputRoot 'mah_route_indicator_friction_model.pdf'
$appendixPdf=Join-Path $outputRoot 'mah_route_indicator_friction_model_appendix.pdf'
$mainLog=Join-Path $paperRoot 'build\mah_route_indicator_friction_model\mah_route_indicator_friction_model.log'
$appendixLog=Join-Path $paperRoot 'build\mah_route_indicator_friction_model_appendix\mah_route_indicator_friction_model_appendix.log'
$mainBbl=Join-Path $paperRoot 'build\mah_route_indicator_friction_model\mah_route_indicator_friction_model.bbl'
$appendixBbl=Join-Path $paperRoot 'build\mah_route_indicator_friction_model_appendix\mah_route_indicator_friction_model_appendix.bbl'
$approvalPath=Join-Path $specRoot 'approvals\phase18_explicit_user_approval.md'
$preflightPath=Join-Path $auditRoot 'phase18_preflight.md'
$integrationMapPath=Join-Path $auditRoot 'phase18_integration_map.md'
$diffSummaryPath=Join-Path $auditRoot 'phase18_diff_summary.md'
$renderAuditPath=Join-Path $auditRoot 'phase18_pdf_render_audit.md'
$independentAuditPath=Join-Path $auditRoot 'phase18_independent_audit.md'
$gatePath=Join-Path $auditRoot 'phase18_gate_report.md'
$jsonPath=Join-Path $auditRoot 'phase18_audit_results.json'
$compileConsolePath=Join-Path $auditRoot 'phase18_compile_console.txt'
$mainLogCopy=Join-Path $auditRoot 'phase18_main_final_log.txt'
$appendixLogCopy=Join-Path $auditRoot 'phase18_appendix_final_log.txt'

$lockedBase='cd5b6e49608749e0bf32f3d9aa235a84f378347b'
$entryCommit='aae9b14fdbdd7da94dfd6ea3c88d5e1da815cb2d'
$checks=[Collections.Generic.List[object]]::new()

function Add-Check([string]$Id,[bool]$Passed,[string]$Evidence){
  $checks.Add([pscustomobject]@{id=$Id;passed=$Passed;evidence=$Evidence})
}
function Read-Utf8([string]$Path){
  [IO.File]::ReadAllText($Path,[Text.Encoding]::UTF8)
}
function Write-Utf8([string]$Path,[string]$Text){
  [IO.File]::WriteAllText($Path,$Text,[Text.UTF8Encoding]::new($false))
}
function Test-Hash([string]$Id,[string]$Path,[string]$Expected){
  $actual=if(Test-Path -LiteralPath $Path -PathType Leaf){
    (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash
  }else{'MISSING'}
  Add-Check $Id ($actual -eq $Expected) "expected=$Expected actual=$actual"
}
function Test-Log([string]$Id,[string]$Path){
  $text=if(Test-Path -LiteralPath $Path){Read-Utf8 $Path}else{''}
  $patterns=@(
    '! LaTeX Error:','Fatal error occurred','Emergency stop',
    'There were undefined references','There were undefined citations',
    'Citation .* undefined','Reference .* undefined',
    'multiply defined','multiply-defined',
    'Label(s) may have changed. Rerun to get cross-references right.',
    'Rerun to get cross-references right'
  )
  $hits=[Collections.Generic.List[string]]::new()
  foreach($pattern in $patterns){
    if($pattern.Contains('.*')){
      if([regex]::IsMatch($text,$pattern,[Text.RegularExpressions.RegexOptions]::IgnoreCase)){$hits.Add($pattern)}
    }elseif($text.Contains($pattern)){$hits.Add($pattern)}
  }
  $boxes=@([regex]::Matches($text,'(?m)^(Overfull|Underfull) \\[hv]box')).Count
  Add-Check $Id ($text.Length -gt 0 -and $hits.Count -eq 0 -and $boxes -eq 0) "hits=$($hits -join ';') boxes=$boxes"
}
function Get-RelativeStatusPath([string]$Line){
  if([string]::IsNullOrWhiteSpace($Line)){return ''}
  $path=$Line.Substring(3).Trim()
  if($path.Contains(' -> ')){$path=($path -split ' -> ')[-1]}
  $path.Replace('\','/')
}

# Frozen-source and effective-spec integrity.
foreach($source in @(
 @('P18-HASH-BASE','MAH_model_rebuild_execution_note_for_Codex.md','F6C11377D71E4E25D40FFB8AC9FE2EA7AA051AD7E123BA7E3A32DBA895342B24'),
 @('P18-HASH-AMD11','MAH_model_rebuild_amendment_v1.1_for_Codex.md','D76856241E460D31087AB60690E85D5681806E53BD42991F725458727CCD1EA9'),
 @('P18-HASH-AMD12-IMAGE','MAH_model_rebuild_correction_v1.2.png','1C0035AB49A5FF5C207CB71C1E3F04CFAC4E333BEDDAB73841D2A72F603723E5'),
 @('P18-HASH-AMD12-TEXT','MAH_model_rebuild_correction_v1.2_transcription.md','06AF48B2D853EA82F7176505D2ACA4D0CBFE06E5DB52C18026308196FE85E48E')
)){Test-Hash $source[0] (Join-Path $sourceRoot $source[1]) $source[2]}
Test-Hash 'P18-HASH-EFFECTIVE' (Join-Path $specRoot 'MAH_model_rebuild_effective_spec_v1.2.md') '855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666'

# Git entry, isolation, and authorized source scope.
$branch=(& git -C $repoRoot branch --show-current).Trim()
$head=(& git -C $repoRoot rev-parse HEAD).Trim()
$remote=(& git -C $repoRoot rev-parse origin/codex/mah-model-rebuild).Trim()
Add-Check 'P18-GIT-BRANCH' ($branch -eq 'codex/mah-model-rebuild') "branch=$branch"
Add-Check 'P18-GIT-ENTRY' ($head -eq $entryCommit) "head=$head"
Add-Check 'P18-GIT-REMOTE' ($remote -eq $entryCommit) "remote=$remote"
$zipStatus=@(& git -C $repoRoot status --porcelain=v1 -- paper/collaboration/MAH_model_update_20260717.zip)
Add-Check 'P18-ZIP-ISOLATED' ($zipStatus.Count -eq 0) "count=$($zipStatus.Count)"
$manuscriptDiff=@(& git -C $repoRoot diff --name-only $lockedBase -- paper/manuscript | ForEach-Object{$_.Replace('\','/')} | Sort-Object)
$expectedManuscript=@(
 'paper/manuscript/mah_route_indicator_friction_model.tex',
 'paper/manuscript/mah_route_indicator_friction_model_appendix.tex',
 'paper/manuscript/mah_route_indicator_friction_refs.bib'
) | Sort-Object
Add-Check 'P18-MANUSCRIPT-SCOPE' (($manuscriptDiff -join '|') -eq ($expectedManuscript -join '|')) "changed=$($manuscriptDiff -join ';')"
$outputDiff=@(& git -C $repoRoot diff --name-only $lockedBase -- paper/output | ForEach-Object{$_.Replace('\','/')} | Sort-Object)
$expectedOutput=@(
 'paper/output/mah_route_indicator_friction_model.pdf',
 'paper/output/mah_route_indicator_friction_model_appendix.pdf'
) | Sort-Object
Add-Check 'P18-OUTPUT-SCOPE' (($outputDiff -join '|') -eq ($expectedOutput -join '|')) "changed=$($outputDiff -join ';')"
$memoDiff=@(& git -C $repoRoot diff --name-only $lockedBase -- paper/manuscript/mah_route_indicator_friction_model_technical_memo.tex)
Add-Check 'P18-LEGACY-MEMO-UNCHANGED' ($memoDiff.Count -eq 0) "changed=$($memoDiff -join ';')"
$diffCheck=@(& git -C $repoRoot diff --check 2>&1)
Add-Check 'P18-DIFF-CHECK' ($LASTEXITCODE -eq 0) "output=$($diffCheck -join ' | ')"

# Approval and byte-preserving backups.
foreach($path in @($approvalPath,$preflightPath,$integrationMapPath,$diffSummaryPath,$renderAuditPath,$independentAuditPath,$gatePath)){
  Add-Check ('P18-FILE-'+[IO.Path]::GetFileName($path)) (Test-Path -LiteralPath $path -PathType Leaf) "path=$path"
}
$approval=if(Test-Path -LiteralPath $approvalPath){Read-Utf8 $approvalPath}else{''}
Add-Check 'P18-EXPLICIT-APPROVAL' ($approval.Contains('批准 Phase 18 manuscript integration') -and $approval.Contains('separate')) 'explicit Phase 18 authorization recorded'
foreach($item in @(
 @('P18-BACKUP-MAIN','mah_route_indicator_friction_model.tex','42EB3F87C8AB825E8B49DAE9ADE89580C8239D1CEC73866EE6A5059BCBE0FDE1'),
 @('P18-BACKUP-APPENDIX','mah_route_indicator_friction_model_appendix.tex','34E331D707B7574AAF8398287182763664E3C3DBBB0D1B8ED5F72E5C8DD71D43'),
 @('P18-BACKUP-MEMO','mah_route_indicator_friction_model_technical_memo.tex','43FFFDE5CAA4DF825780FEA8CEF7EB5C990EFDFCF5C9A1C5E0A25261FD4FF966'),
 @('P18-BACKUP-BIB','mah_route_indicator_friction_refs.bib','D63A546B4CA407D24737EC1EF3CA97A4E3369D6861FC80C2684A8B11205879B5'),
 @('P18-BACKUP-MAIN-PDF','mah_route_indicator_friction_model.pdf','B2D203F68AF83F4B47F0E2CFF3CCC1179FFC5594AE3CA0ECCDC9AD1957944A46'),
 @('P18-BACKUP-APPENDIX-PDF','mah_route_indicator_friction_model_appendix.pdf','2D9680D07125DE8FD20F0250635AD956B67D3DCEE6D0A8C7670A32274841727C')
)){Test-Hash $item[0] (Join-Path $backupRoot $item[1]) $item[2]}
Test-Hash 'P18-ACTIVE-MEMO-HASH' $memoPath '43FFFDE5CAA4DF825780FEA8CEF7EB5C990EFDFCF5C9A1C5E0A25261FD4FF966'

# State machine and traceability rows.
$statusText=Read-Utf8 $statusPath
$statusNeedle="| 18 Manuscript integration | $($ExpectedStatus -replace '_',' ') |"
Add-Check 'P18-STATE-P17' $statusText.Contains('| 17 Consistency audit | APPROVED |') 'Phase 17 approved'
Add-Check 'P18-STATE-P18' $statusText.Contains($statusNeedle) "expected=$statusNeedle"
$openIssuesText=Read-Utf8 $openIssuesPath
$openHeadings=@([regex]::Matches($openIssuesText,'(?m)^##\s+OPEN\b')).Count
Add-Check 'P18-OPEN-ISSUES-CLOSED' ($openHeadings -eq 0) "open_headings=$openHeadings"
$matrix=Import-Csv -LiteralPath $matrixPath
foreach($id in @('P18-D01','P18-G01')){
  $row=@($matrix|Where-Object requirement_id -eq $id)
  $ok=$row.Count -eq 1 -and $row[0].current_status -eq $ExpectedStatus -and $row[0].approval_status -eq 'YES'
  Add-Check ('P18-MATRIX-'+$id) $ok "rows=$($row.Count) status=$($row[0].current_status) approval=$($row[0].approval_status)"
}

# Rebuild both final manuscript targets in project-local D-drive directories.
$tempRoot=Join-Path $paperRoot 'build\phase18_tmp'
if(-not (Test-Path -LiteralPath $tempRoot)){New-Item -ItemType Directory -Path $tempRoot | Out-Null}
$oldTemp=$env:TEMP
$oldTmp=$env:TMP
$env:TEMP=$tempRoot
$env:TMP=$tempRoot
$console=[Collections.Generic.List[string]]::new()
try{
  $console.Add('=== MAIN MANUSCRIPT BUILD ===')
  foreach($line in @(& (Join-Path $paperRoot 'build.ps1') -KeepBuild 2>&1)){$console.Add([string]$line)}
  $console.Add('=== TECHNICAL APPENDIX BUILD ===')
  foreach($line in @(& (Join-Path $paperRoot 'build_appendix.ps1') -KeepBuild 2>&1)){$console.Add([string]$line)}
}finally{
  $env:TEMP=$oldTemp
  $env:TMP=$oldTmp
}
Write-Utf8 $compileConsolePath (($console -join [Environment]::NewLine)+[Environment]::NewLine)
if(Test-Path -LiteralPath $mainLog){Write-Utf8 $mainLogCopy (Read-Utf8 $mainLog)}
if(Test-Path -LiteralPath $appendixLog){Write-Utf8 $appendixLogCopy (Read-Utf8 $appendixLog)}
foreach($path in @($mainPdf,$appendixPdf,$mainLog,$appendixLog,$mainBbl,$appendixBbl,$compileConsolePath,$mainLogCopy,$appendixLogCopy)){
  Add-Check ('P18-BUILD-'+[IO.Path]::GetFileName($path)) (Test-Path -LiteralPath $path -PathType Leaf) "path=$path"
}
Test-Log 'P18-LATEX-MAIN' $mainLog
Test-Log 'P18-LATEX-APPENDIX' $appendixLog

# Page-count and complete visual inspection evidence.
$pdfinfo='C:\Users\dongw\.cache\codex-runtimes\codex-primary-runtime\dependencies\native\poppler\Library\bin\pdfinfo.exe'
foreach($pair in @(@($mainPdf,12,'P18-PDF-MAIN'),@($appendixPdf,32,'P18-PDF-APPENDIX'))){
  $info=if(Test-Path -LiteralPath $pdfinfo){@(& $pdfinfo $pair[0])}else{@()}
  $pageLine=@($info|Where-Object{$_ -match '^Pages:'})|Select-Object -First 1
  Add-Check $pair[2] ($pageLine -match "Pages:\s+$($pair[1])$") "line=$pageLine"
}
$renderAudit=if(Test-Path -LiteralPath $renderAuditPath){Read-Utf8 $renderAuditPath}else{''}
Add-Check 'P18-PDF-RENDER-AUDIT' (
  $renderAudit.Contains('Main pages inspected: 12 of 12') -and
  $renderAudit.Contains('Appendix pages inspected: 32 of 32') -and
  $renderAudit.Contains('Visual defects found: 0')
) 'all 44 final PDF pages visually inspected'

# Main-text architecture and v1.2 interpretation.
$main=Read-Utf8 $mainPath
$appendix=Read-Utf8 $appendixPath
$bib=Read-Utf8 $bibPath
$mainNormalized=[regex]::Replace($main,'\s+',' ').Trim()
$appendixNormalized=[regex]::Replace($appendix,'\s+',' ').Trim()
$requiredMain=@(
 'original-drug innovation investment / project-advancement intensity',
 '\tau_E(0)=+\infty',
 '\max\{W_i^I,W_i^E,W^T,W^A\}',
 'no logit or',
 '\Omega_i(M,p_m)',
 'only through \(\Omega_i\)',
 'D_m(p_m^*;M)=S_m(p_m^*)',
 '\left\{',
 'p_m^*,\;',
 'Holder--producer separation is observed only after route assignment',
 'Patent applications are a separate patenting margin and are not a baseline endogenous outcome',
 'imposes no original-versus-incremental ranking'
)
foreach($needle in $requiredMain){
  Add-Check ('P18-MAIN-'+$needle.GetHashCode().ToString('X8')) $mainNormalized.Contains($needle) "required=$needle"
}
foreach($pattern in @('\\eta','\\Gamma','eq:logit_prob','eq:Gamma','P_i\(','x_i\^R','x_i\^D')){
  $count=[regex]::Matches($main,$pattern).Count
  Add-Check ('P18-MAIN-NO-OLD-'+$pattern.GetHashCode().ToString('X8')) ($count -eq 0) "pattern=$pattern count=$count"
}
Add-Check 'P18-MAIN-FOUR-OBJECT-EQUILIBRIUM' (
  $main.Contains('p_m^*,\;') -and $main.Contains('x_i^*,\;') -and
  $main.Contains('r_i^*(q,m),\;') -and $main.Contains('s_j^*')
) 'exact partial-equilibrium object collection present'

# Appendix container order, expanded labels, and baseline/extension quarantine.
$appendixInputs=@(
 '01_primitives_and_timing.tex','02_demand_profit_derivation.tex',
 '03_internal_external_technologies.tex','04_route_values_and_sorting.tex',
 '05_rd_problem.tex','06_cmo_supply_demand_equilibrium.tex',
 '07_equilibrium_definition.tex','08_required_propositions.tex',
 '08_comparative_statics.tex','09_observed_outcomes.tex',
 '11_extensions_not_baseline.tex'
)
$positions=[Collections.Generic.List[int]]::new()
foreach($file in $appendixInputs){$positions.Add($appendix.IndexOf("\input{../model_rebuild/$file}"))}
$ordered=$true
for($i=0;$i -lt $positions.Count;$i++){
  if($positions[$i] -lt 0){$ordered=$false}
  if($i -gt 0 -and $positions[$i] -le $positions[$i-1]){$ordered=$false}
}
$boundaryPosition=$appendix.IndexOf('\section{Research versus Development: Boundary of the Baseline}')
$extensionPosition=$appendix.IndexOf('\input{../model_rebuild/11_extensions_not_baseline.tex}')
Add-Check 'P18-APPENDIX-INPUT-ORDER' $ordered "positions=$($positions -join ',')"
Add-Check 'P18-APPENDIX-EXTENSION-LAST' ($extensionPosition -gt $boundaryPosition -and $boundaryPosition -gt 0) "boundary=$boundaryPosition extension=$extensionPosition"

$baselineFiles=$appendixInputs[0..9]
$expandedBaseline=[Collections.Generic.List[string]]::new()
foreach($file in $baselineFiles){$expandedBaseline.Add((Read-Utf8 (Join-Path $modelRebuild $file)))}
$baselineText=$expandedBaseline -join [Environment]::NewLine
foreach($pattern in @('P_\{ir\}\^\{\\mathrm\{logit\}\}','\\Gamma','x_i\^R','x_i\^D','\\frac\{\\partial[^\r\n]*\}\{\\partial M\}')){
  $count=[regex]::Matches($baselineText,$pattern).Count
  Add-Check ('P18-BASELINE-NO-OLD-'+$pattern.GetHashCode().ToString('X8')) ($count -eq 0) "pattern=$pattern count=$count"
}
$etaCount=[regex]::Matches($baselineText,'\\eta').Count
Add-Check 'P18-NO-ETA-BASELINE' ($etaCount -eq 0) "eta_count=$etaCount"
$baselineNormalized=[regex]::Replace($baselineText,'\s+',' ').Trim()
$baselineXigCount=[regex]::Matches($baselineText,'x_\{ig\}').Count
$mainXigCount=[regex]::Matches($main,'x_\{ig\}').Count
$negativeXigBoundaries=@(
  'does not create a separate control \(x_{ig}\)',
  'There is no class-specific control \(x_{ig}\)',
  'There is one common \(x_i^*\), not an \(x_{ig}\) control',
  'does not create a control \(x_{ig}\)'
)
$negativeXigComplete=$true
foreach($needle in $negativeXigBoundaries){if(-not $baselineNormalized.Contains($needle)){$negativeXigComplete=$false}}
Add-Check 'P18-XIG-NEGATIVE-BOUNDARY' ($baselineXigCount -eq 5 -and $mainXigCount -eq 1 -and $negativeXigComplete -and $mainNormalized.Contains('The classifier creates no \(x_{ig}\)')) "baseline_count=$baselineXigCount main_count=$mainXigCount all_negative_boundaries=$negativeXigComplete"
$props=Read-Utf8 (Join-Path $modelRebuild '08_required_propositions.tex')
$propLabels=@([regex]::Matches($props,'\\label\{prop:([^}]+)\}'))
$corLabels=@([regex]::Matches($props,'\\label\{cor:([^}]+)\}'))
Add-Check 'P18-SIX-PROPOSITIONS' ($propLabels.Count -eq 6) "count=$($propLabels.Count)"
Add-Check 'P18-ONE-NOVELTY-COROLLARY' ($corLabels.Count -eq 1 -and $props.Contains('Novelty composition is ambiguous')) "count=$($corLabels.Count)"

$extension=Read-Utf8 (Join-Path $modelRebuild '11_extensions_not_baseline.tex')
Add-Check 'P18-EXTENSION-QUARANTINE' (
  $extension.Contains('P_{ir}^{\mathrm{logit}}') -and
  $extension.Contains('x_i^R') -and $extension.Contains('x_i^D') -and
  $extension.Contains('remain inactive and cannot be cited as baseline')
) 'all non-baseline mechanisms remain explicitly inactive'
$readerText=[regex]::Replace(($baselineText+[Environment]::NewLine+$extension),'(?m)^\s*%.*$','')
$internalProcessPatterns=@(
  'Phase~?\s*\d','Phases~?\s*\d','\bapproved\b','\bauthorized\b',
  '\bdeliverable\b','\bcrosswalk\b','paper/model_','model_notes',
  'user-approved','manuscript candidate','scope audit','limiting-case audit',
  '\bdraft\b','\brebuilt\b','appendix split','separate approval',
  'separately approved','baseline modules','\bquarantin\w*\b',
  '\bauditable\b','\baudited\b','measurement audit'
)
$internalHits=@($internalProcessPatterns|Where-Object{[regex]::IsMatch($readerText,$_ ,[Text.RegularExpressions.RegexOptions]::IgnoreCase)})
Add-Check 'P18-NO-READER-INTERNAL-PROCESS' ($internalHits.Count -eq 0) "patterns=$($internalHits -join ';')"

# Label namespace and bibliography completeness.
$mainLabels=@([regex]::Matches($main,'\\label\{([^}]+)\}')|ForEach-Object{$_.Groups[1].Value})
$mainDuplicates=@($mainLabels|Group-Object|Where-Object Count -gt 1)
Add-Check 'P18-MAIN-LABELS-UNIQUE' ($mainDuplicates.Count -eq 0) "duplicates=$(@($mainDuplicates|ForEach-Object{$_.Name}) -join ';')"
$expandedLabels=[Collections.Generic.List[string]]::new()
foreach($match in [regex]::Matches($appendix,'\\label\{([^}]+)\}')){$expandedLabels.Add($match.Groups[1].Value)}
foreach($file in $appendixInputs){
  foreach($match in [regex]::Matches((Read-Utf8 (Join-Path $modelRebuild $file)),'\\label\{([^}]+)\}')){$expandedLabels.Add($match.Groups[1].Value)}
}
$appendixDuplicates=@($expandedLabels|Group-Object|Where-Object Count -gt 1)
Add-Check 'P18-APPENDIX-LABELS-UNIQUE' ($appendixDuplicates.Count -eq 0) "duplicates=$(@($appendixDuplicates|ForEach-Object{$_.Name}) -join ';')"

$citationText=$main+$appendix+$baselineText+$extension
$cited=[Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
foreach($match in [regex]::Matches($citationText,'\\cite[pt]?\{([^}]+)\}')){
  foreach($key in $match.Groups[1].Value.Split(',')){[void]$cited.Add($key.Trim())}
}
$bibKeys=[Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
foreach($match in [regex]::Matches($bib,'(?m)^@[A-Za-z]+\{([^,]+),')){[void]$bibKeys.Add($match.Groups[1].Value.Trim())}
$missingCitations=@($cited|Where-Object{-not $bibKeys.Contains($_)}|Sort-Object)
Add-Check 'P18-CITATIONS-DEFINED' ($missingCitations.Count -eq 0) "missing=$($missingCitations -join ';')"
Add-Check 'P18-SHIGU-BIB' ($bibKeys.Contains('Gu2024') -and $bib.Contains('SSRN 4770849') -and $bib.Contains('August 22, 2024 version')) 'Gu 2024 frozen-version citation present'

# Shi Gu evidence and v1.2 empirical boundary in the final appendix.
foreach($needle in @(
 'Table II, p.~45','Tables III--IV, pp.~46--47','Table V, p.~48',
 'Table VIII, p.~51','Table VII, p.~50','Table IX, p.~52',
 'no formal cross-column equality test is reported',
 'evidence neither identifies nor requires a binding constraint',
 'but it does not imply that MAH raises patent applications'
)){
  Add-Check ('P18-EVIDENCE-'+$needle.GetHashCode().ToString('X8')) $appendixNormalized.Contains($needle) "required=$needle"
}

# Exact changed-file boundary within this worktree.
$allowed=@(
 'paper/manuscript/mah_route_indicator_friction_model.tex',
 'paper/manuscript/mah_route_indicator_friction_model_appendix.tex',
 'paper/manuscript/mah_route_indicator_friction_refs.bib',
 'paper/model_rebuild/01_primitives_and_timing.tex',
 'paper/model_rebuild/02_demand_profit_derivation.tex',
 'paper/model_rebuild/03_internal_external_technologies.tex',
 'paper/model_rebuild/04_route_values_and_sorting.tex',
 'paper/model_rebuild/05_rd_problem.tex',
 'paper/model_rebuild/06_cmo_supply_demand_equilibrium.tex',
 'paper/model_rebuild/07_equilibrium_definition.tex',
 'paper/model_rebuild/08_required_propositions.tex',
 'paper/model_rebuild/08_comparative_statics.tex',
 'paper/model_rebuild/09_observed_outcomes.tex',
 'paper/model_rebuild/11_extensions_not_baseline.tex',
 'paper/model_notes/00_model_closure_status.md',
 'paper/model_notes/06_open_issues_log.md',
 'paper/model_rebuild/spec/instruction_traceability_matrix.csv',
 'paper/model_rebuild/spec/specification_hashes.md',
 'paper/model_rebuild/spec/approvals/phase18_explicit_user_approval.md',
 'paper/model_rebuild/backups/phase18_preintegration/BACKUP_MANIFEST.md',
 'paper/model_rebuild/backups/phase18_preintegration/mah_route_indicator_friction_model.tex',
 'paper/model_rebuild/backups/phase18_preintegration/mah_route_indicator_friction_model_appendix.tex',
 'paper/model_rebuild/backups/phase18_preintegration/mah_route_indicator_friction_model_technical_memo.tex',
 'paper/model_rebuild/backups/phase18_preintegration/mah_route_indicator_friction_refs.bib',
 'paper/model_rebuild/backups/phase18_preintegration/mah_route_indicator_friction_model.pdf',
 'paper/model_rebuild/backups/phase18_preintegration/mah_route_indicator_friction_model_appendix.pdf',
 'paper/model_rebuild/audit/phase18_preflight.md',
 'paper/model_rebuild/audit/phase18_integration_map.md',
 'paper/model_rebuild/audit/phase18_diff_summary.md',
 'paper/model_rebuild/audit/phase18_pdf_render_audit.md',
 'paper/model_rebuild/audit/phase18_independent_audit.md',
 'paper/model_rebuild/audit/phase18_gate_report.md',
 'paper/model_rebuild/audit/phase18_audit_results.json',
 'paper/model_rebuild/audit/phase18_compile_console.txt',
 'paper/model_rebuild/audit/phase18_main_final_log.txt',
 'paper/model_rebuild/audit/phase18_appendix_final_log.txt',
 'paper/model_rebuild/audit/phase18_artifact_hashes.md',
 'paper/model_rebuild/audit/phase18_commit_manifest.txt',
 'paper/model_rebuild/scripts/audit_phase18.ps1',
 'paper/output/mah_route_indicator_friction_model.pdf',
 'paper/output/mah_route_indicator_friction_model_appendix.pdf'
)
$allowedSet=[Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
foreach($path in $allowed){[void]$allowedSet.Add($path)}
$unexpected=[Collections.Generic.List[string]]::new()
foreach($line in @(& git -C $repoRoot status --porcelain=v1 --untracked-files=all)){
  $path=Get-RelativeStatusPath $line
  if(-not [string]::IsNullOrWhiteSpace($path) -and -not $allowedSet.Contains($path)){$unexpected.Add($path)}
}
Add-Check 'P18-SCOPE-EXACT' ($unexpected.Count -eq 0) "unexpected=$($unexpected -join ';')"

if($ExpectedStatus -in @('READY_FOR_APPROVAL','APPROVED')){
  $gate=if(Test-Path -LiteralPath $gatePath){Read-Utf8 $gatePath}else{''}
  $independent=if(Test-Path -LiteralPath $independentAuditPath){Read-Utf8 $independentAuditPath}else{''}
  $ids=@()
  $ids+=(1..28|ForEach-Object{'RL-'+$_.ToString('00')})
  $ids+=@('P18-D01','P18-G01')
  $ids+=(1..10|ForEach-Object{'QA-PROOF-'+$_.ToString('00')})
  $ids+=(1..8|ForEach-Object{'QA-ECON-'+$_.ToString('00')})
  $ids+=(1..13|ForEach-Object{'SUCCESS-'+$_.ToString('00')})
  $missingGate=@($ids|Where-Object{-not $gate.Contains($_)})
  Add-Check 'P18-GATE-IDS' ($missingGate.Count -eq 0) "missing=$($missingGate -join ';')"
  Add-Check 'P18-GATE-RESULT' ($gate.Contains('P0: 0') -and $gate.Contains('P1 remaining: 0') -and $gate.Contains('Overall gate: PASS')) 'gate PASS'
  Add-Check 'P18-INDEPENDENT-RESULT' ($independent.Contains('P0: 0') -and $independent.Contains('P1 remaining: 0')) 'independent reviews closed'
}

$failed=@($checks|Where-Object{-not $_.passed})
$result=[ordered]@{
  phase=18
  expected_status=$ExpectedStatus
  status=if($failed.Count -eq 0){$ExpectedStatus}else{'AUDIT_FAILED'}
  generated_at=(Get-Date).ToString('o')
  passed=@($checks|Where-Object passed).Count
  failed=$failed.Count
  checks=$checks
}
Write-Utf8 $jsonPath (($result|ConvertTo-Json -Depth 6)+[Environment]::NewLine)
Write-Output "SUMMARY status=$($result.status) passed=$($result.passed) failed=$($result.failed) report=$jsonPath"
foreach($item in $failed){Write-Output "FAIL $($item.id): $($item.evidence)"}
if($failed.Count -gt 0){exit 1}
