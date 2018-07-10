$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.snapgene.com/products/snapgene_viewer/download.php?&majorRelease=4.2&minorRelease=4.2.0&os=windows'
  softwareName   = 'SnapGene Viewer'
  checksum       = '9fc0ce33372c172c640a7fadf2f185c1d493ec6ad663eeceaf3e06d7f42a34c8a953907e15b9c9d21a52db9021e81759d4f35b232cb49fa7b8ecd6758b392c30'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
