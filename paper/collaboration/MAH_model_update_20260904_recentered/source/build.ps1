param(
    [switch]$Clean,
    [switch]$KeepBuild
)

$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$buildTex = Join-Path $scriptDir "build_tex.ps1"

& $buildTex `
    -TexFile "manuscript\mah_route_indicator_friction_model.tex" `
    -Engine "pdflatex" `
    -Clean:$Clean `
    -KeepBuild:$KeepBuild
