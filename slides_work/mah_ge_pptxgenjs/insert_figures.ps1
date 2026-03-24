param(
  [string]$InputPath = "8.制度改革与医药创新_1015_pptxgenjs_restructured.pptx",
  [string]$OutputPath = "8.制度改革与医药创新_1015_pptxgenjs_restructured.pptx"
)

$ErrorActionPreference = "Stop"

$workspace = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $workspace

$resolvedInput = (Resolve-Path $InputPath).Path
$resolvedOutput = Join-Path $workspace $OutputPath
$workPath = Join-Path $workspace "deck_with_figures_work_ascii.pptx"
$mediaDir = Join-Path $workspace "extracted_media_white"

$slots = @(
  @{ slide = 5; asset = "image3.png";  x = 0.74; y = 1.52; w = 4.46; h = 4.36 }
  @{ slide = 14; asset = "image5.jpeg"; x = 0.82; y = 1.66; w = 4.58; h = 4.52 }
  @{ slide = 20; asset = "image7.png";  x = 0.86; y = 2.56; w = 3.84; h = 2.86 }
  @{ slide = 20; asset = "image8.png";  x = 5.04; y = 2.56; w = 3.84; h = 2.86 }
  @{ slide = 21; asset = "image4.png";  x = 5.04; y = 1.86; w = 3.78; h = 3.94 }
  @{ slide = 22; asset = "image9.png";  x = 0.90; y = 2.36; w = 3.96; h = 3.50 }
  @{ slide = 22; asset = "image10.png"; x = 5.06; y = 2.36; w = 3.96; h = 3.50 }
  @{ slide = 23; asset = "image11.jpeg"; x = 0.90; y = 1.96; w = 3.96; h = 3.50 }
  @{ slide = 23; asset = "image12.jpeg"; x = 5.06; y = 1.96; w = 3.96; h = 3.50 }
)

function Convert-InchesToPoints([double]$value) {
  return $value * 72.0
}

Copy-Item $resolvedInput $workPath -Force

$pp = $null
$pres = $null

try {
  $pp = New-Object -ComObject PowerPoint.Application
  $pres = $pp.Presentations.Open($workPath, $true, $false, $false)

  foreach ($slot in $slots) {
    $slide = $pres.Slides.Item($slot.slide)
    $assetPath = Join-Path $mediaDir $slot.asset
    if (-not (Test-Path $assetPath)) {
      throw "Missing asset: $assetPath"
    }

    $left = Convert-InchesToPoints ($slot.x + 0.08)
    $top = Convert-InchesToPoints ($slot.y + 0.08)
    $width = Convert-InchesToPoints ($slot.w - 0.16)
    $height = Convert-InchesToPoints ($slot.h - 0.34)

    for ($i = $slide.Shapes.Count; $i -ge 1; $i--) {
      $shape = $slide.Shapes.Item($i)
      $shapeLeft = [double]$shape.Left
      $shapeTop = [double]$shape.Top
      $shapeRight = $shapeLeft + [double]$shape.Width
      $shapeBottom = $shapeTop + [double]$shape.Height

      $insideBox =
        $shapeLeft -ge ($left - 1) -and
        $shapeTop -ge ($top - 1) -and
        $shapeRight -le ($left + $width + 1) -and
        $shapeBottom -le ($top + $height + 1)

      if ($insideBox) {
        $shape.Delete()
      }
    }

    $picture = $slide.Shapes.AddPicture($assetPath, $false, $true, 0, 0, -1, -1)
    $picture.LockAspectRatio = -1

    $boxRatio = $width / $height
    $picRatio = [double]$picture.Width / [double]$picture.Height

    if ($picRatio -ge $boxRatio) {
      $picture.Width = $width
    }
    else {
      $picture.Height = $height
    }

    $picture.Left = $left + (($width - [double]$picture.Width) / 2.0)
    $picture.Top = $top + (($height - [double]$picture.Height) / 2.0)
  }

  $pres.Save()
  $pres.Close()
  $pp.Quit()

  Copy-Item $workPath $resolvedOutput -Force
  Write-Output "Inserted figures into $resolvedOutput"
}
finally {
  if ($pres -ne $null) {
    try { $pres.Close() } catch {}
  }
  if ($pp -ne $null) {
    try { $pp.Quit() } catch {}
  }
}
