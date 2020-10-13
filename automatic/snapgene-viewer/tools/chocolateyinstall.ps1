$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://cdn.snapgene.com/downloads/SnapGeneViewer/5.x/5.2/5.2.0/snapgene_viewer_5.2.0_win.exe'
  softwareName   = 'SnapGene Viewer'
  checksum       = '284975c9d7b6ebff4a67617eb4f8fb889dc8252f0831692d4567b3a377357be9ab4b6eb81d637da2a433ae7c95c84dedde02a1f5b68d1f822fa5120efd20166f'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
