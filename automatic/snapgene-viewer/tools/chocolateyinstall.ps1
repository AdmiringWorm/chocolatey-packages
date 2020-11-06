$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://cdn.snapgene.com/downloads/SnapGeneViewer/5.x/5.2/5.2.2/snapgene_viewer_5.2.2_win.exe'
  softwareName   = 'SnapGene Viewer'
  checksum       = '2dad2016a56c12ec77696055bb582f753ea20d688360e0e58ed7df4060878e67a0ff3c643d30379709b0ada1bdc0da2f7ceef3f76a35bf7a50a051a2889b449f'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
