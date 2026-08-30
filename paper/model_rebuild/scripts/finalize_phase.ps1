param(
    [Parameter(Mandatory = $true)]
    [ValidateRange(1, 18)]
    [int]$Phase,

    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$CommitMessage,

    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$Manifest
)

$ErrorActionPreference = 'Stop'

$repoRootRaw = (& git rev-parse --show-toplevel).Trim()
if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($repoRootRaw)) {
    throw 'Not inside the model-rebuild Git worktree.'
}
$repoRoot = [System.IO.Path]::GetFullPath($repoRootRaw)

$branch = (& git branch --show-current).Trim()
if ($branch -ne 'codex/mah-model-rebuild') {
    throw "Unexpected branch: $branch"
}

$manifestPath = if ([System.IO.Path]::IsPathRooted($Manifest)) {
    [System.IO.Path]::GetFullPath($Manifest)
} else {
    [System.IO.Path]::GetFullPath((Join-Path $repoRoot $Manifest))
}
$repoPrefix = $repoRoot.TrimEnd('\') + '\'
if (-not $manifestPath.StartsWith($repoPrefix, [System.StringComparison]::OrdinalIgnoreCase)) {
    throw 'The commit manifest must be inside the model-rebuild worktree.'
}
if (-not (Test-Path -LiteralPath $manifestPath -PathType Leaf)) {
    throw "Missing commit manifest: $manifestPath"
}

$paths = [System.Collections.Generic.List[string]]::new()
foreach ($rawLine in Get-Content -LiteralPath $manifestPath -Encoding UTF8) {
    $path = $rawLine.Trim()
    if ([string]::IsNullOrWhiteSpace($path) -or $path.StartsWith('#')) { continue }
    $normalized = $path.Replace('\', '/')
    if ([System.IO.Path]::IsPathRooted($path) -or $normalized.Contains('../') -or $normalized.StartsWith('../') -or $normalized.Contains('/.git/') -or $normalized.StartsWith('.git/')) {
        throw "Unsafe manifest path: $path"
    }
    if ($normalized -eq 'paper/collaboration/MAH_model_update_20260717.zip') {
        throw 'The modified collaborator ZIP is forbidden in rebuild commits.'
    }
    if ($Phase -lt 18 -and $normalized.StartsWith('paper/manuscript/')) {
        throw "Phase $Phase cannot modify the manuscript."
    }
    $paths.Add($normalized)
}
if ($paths.Count -eq 0) { throw 'The commit manifest is empty.' }

& git add -- $paths
if ($LASTEXITCODE -ne 0) { throw 'git add failed.' }

$staged = @(& git diff --cached --name-only)
if ($LASTEXITCODE -ne 0 -or $staged.Count -eq 0) { throw 'No staged changes found.' }
$allowed = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
foreach ($path in $paths) { [void]$allowed.Add($path) }
$unexpected = @($staged | Where-Object { -not $allowed.Contains($_.Replace('\', '/')) })
if ($unexpected.Count -gt 0) {
    throw "Unexpected staged paths: $($unexpected -join ', ')"
}

& git diff --cached --check
if ($LASTEXITCODE -ne 0) { throw 'Staged whitespace/error check failed.' }

& git commit -m $CommitMessage
if ($LASTEXITCODE -ne 0) { throw 'git commit failed.' }
$head = (& git rev-parse HEAD).Trim()

& git push origin $branch
if ($LASTEXITCODE -ne 0) { throw 'git push failed.' }

$remoteLine = (& git ls-remote --heads origin $branch | Select-Object -First 1)
if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($remoteLine)) {
    throw 'Could not verify the remote branch.'
}
$remoteHead = ($remoteLine -split '\s+')[0]
if ($remoteHead -ne $head) {
    throw "Remote verification failed: local=$head remote=$remoteHead"
}

Write-Output "PHASE_FINALIZED phase=$Phase commit=$head remote=$remoteHead branch=$branch"
