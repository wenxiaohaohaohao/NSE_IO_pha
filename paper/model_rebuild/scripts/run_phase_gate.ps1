[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [ValidateRange(1, 18)]
    [int]$Phase,

    [Parameter(Mandatory = $true)]
    [ValidateSet('IN_PROGRESS', 'READY_FOR_APPROVAL', 'APPROVED')]
    [string]$ExpectedStatus
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$phaseTag = '{0:D2}' -f $Phase
$compiler = Join-Path $PSScriptRoot 'compile_phase_module.ps1'
$auditor = Join-Path $PSScriptRoot "audit_phase${phaseTag}.ps1"
if (-not (Test-Path -LiteralPath $auditor -PathType Leaf)) {
    throw "Missing phase auditor: $auditor"
}

& $compiler -Phase $Phase
if ($LASTEXITCODE -ne 0) { throw "Phase $Phase compile wrapper failed." }

& $auditor -ExpectedStatus $ExpectedStatus
if ($LASTEXITCODE -ne 0) { throw "Phase $Phase automated audit failed." }
