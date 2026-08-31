[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$modelRebuild = Split-Path -Parent $PSScriptRoot
$outputPath = Join-Path $modelRebuild 'audit\phase13_equation_catalog.csv'
$rows = [Collections.Generic.List[object]]::new()

foreach ($phase in 1..10) {
    $tag = '{0:D2}' -f $phase
    $file = Get-ChildItem -LiteralPath $modelRebuild -Filter ($tag + '_*.tex') |
        Select-Object -First 1
    if ($null -eq $file) { throw "Missing Phase $phase TeX module" }
    $lines = [IO.File]::ReadAllLines($file.FullName,[Text.Encoding]::UTF8)
    $sectionLabel = ''
    $subsectionLabel = ''
    for ($lineIndex = 0; $lineIndex -lt $lines.Length; $lineIndex++) {
        $line = $lines[$lineIndex]
        $labelMatches = [regex]::Matches($line,'\\label\{([^}]+)\}')
        foreach ($labelMatch in $labelMatches) {
            $label = $labelMatch.Groups[1].Value
            if ($label.StartsWith('sec:')) { $sectionLabel = $label; continue }
            if ($label.StartsWith('subsec:')) { $subsectionLabel = $label; continue }
            if (-not $label.StartsWith('eq:')) { continue }

            $start = $lineIndex
            while ($start -ge 0 -and $lines[$start] -notmatch '\\begin\{(?:equation|align|gather|multline)\*?\}') {
                $start--
            }
            if ($start -lt 0) { throw "No equation start for $label in $($file.Name):$($lineIndex + 1)" }
            $end = $lineIndex
            while ($end -lt $lines.Length -and $lines[$end] -notmatch '\\end\{(?:equation|align|gather|multline)\*?\}') {
                $end++
            }
            if ($end -ge $lines.Length) { throw "No equation end for $label in $($file.Name):$($lineIndex + 1)" }
            $body = ($lines[$start..$end] | ForEach-Object { $_.Trim() }) -join ' '
            $references = @(
                [regex]::Matches($body,'\\eqref\{([^}]+)\}') |
                ForEach-Object { $_.Groups[1].Value } |
                Sort-Object -Unique
            )
            $rows.Add([pscustomobject]@{
                phase = $phase
                source_file = $file.Name
                source_line = $lineIndex + 1
                equation_label = $label
                section_label = $sectionLabel
                subsection_label = $subsectionLabel
                explicit_equation_refs = ($references -join ';')
                equation_body = $body
            })
        }
    }
}

$uniqueLabels = @($rows.equation_label | Sort-Object -Unique)
if ($rows.Count -ne 89 -or $uniqueLabels.Count -ne 89) {
    throw "Expected 89 unique equations, found rows=$($rows.Count) unique=$($uniqueLabels.Count)"
}

$rows |
    Sort-Object phase, source_line |
    Export-Csv -LiteralPath $outputPath -NoTypeInformation -Encoding utf8
$csvText = [IO.File]::ReadAllText($outputPath,[Text.Encoding]::UTF8)
$csvText = $csvText.Replace([Environment]::NewLine,[string][char]10)
$csvText = $csvText.Replace([string][char]13,[string][char]10)
[IO.File]::WriteAllText($outputPath,$csvText,[Text.UTF8Encoding]::new($false))

Write-Output "PHASE13_EQUATION_CATALOG=PASS rows=$($rows.Count) output=$outputPath"
