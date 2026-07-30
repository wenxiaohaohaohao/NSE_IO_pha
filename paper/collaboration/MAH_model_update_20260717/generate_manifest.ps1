Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$root = [System.IO.Path]::GetFullPath($PSScriptRoot).TrimEnd([System.IO.Path]::DirectorySeparatorChar)
$manifestPath = Join-Path $root 'FILE_MANIFEST_SHA256.txt'
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

$files = Get-ChildItem -LiteralPath $root -Recurse -File |
    Where-Object { $_.FullName -ne $manifestPath } |
    Sort-Object FullName

$lines = New-Object System.Collections.Generic.List[string]
$lines.Add('# MAH model collaborator package file manifest')
$lines.Add('# Version: 2026-07-17')
$lines.Add('# Format: SHA256<TAB>bytes<TAB>relative path')

foreach ($file in $files) {
    $relativePath = $file.FullName.Substring($root.Length + 1).Replace('\', '/')
    $hash = (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash
    $lines.Add(("{0}`t{1}`t{2}" -f $hash, $file.Length, $relativePath))
}

[System.IO.File]::WriteAllLines($manifestPath, $lines, $utf8NoBom)
Write-Output "Wrote $($files.Count) entries to $manifestPath"
