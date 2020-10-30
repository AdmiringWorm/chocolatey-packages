$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://cdn.snapgene.com/downloads/SnapGeneViewer/5.x/5.2/5.2.1/snapgene_viewer_5.2.1_win.exe'
  softwareName   = 'SnapGene Viewer'
  checksum       = 'b3c85cf590a986119bd2a9c174e4e2471003733cd7ef034648db30538cacfa104763d100f16ae821096c5febebc5cc5304b6cb480779bd85712938e808e35ae7'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
