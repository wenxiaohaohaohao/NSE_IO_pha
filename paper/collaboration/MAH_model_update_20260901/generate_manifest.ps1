$ErrorActionPreference = "Stop"

$packageRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$manifestPath = Join-Path $packageRoot "FILE_MANIFEST_SHA256.txt"

$records = Get-ChildItem -LiteralPath $packageRoot -Recurse -File |
    Where-Object { $_.FullName -ne $manifestPath } |
    ForEach-Object {
        $relativePath = [System.IO.Path]::GetRelativePath($packageRoot, $_.FullName).Replace("\", "/")
        $hash = (Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash
        "{0}  {1}" -f $hash, $relativePath
    } |
    Sort-Object

[System.IO.File]::WriteAllLines(
    $manifestPath,
    [string[]]$records,
    (New-Object System.Text.UTF8Encoding($false))
)

Write-Output "Manifest written to: $manifestPath"
Write-Output "Payload files recorded: $($records.Count)"
