$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.snapgene.com/products/snapgene_viewer/download.php?&majorRelease=4.1&minorRelease=4.1.0&os=windows'
  softwareName   = 'SnapGene Viewer'
  checksum       = '5023e28d2b8997d7da8dff0e5ef96662ec72f8cba71e0dd66cb1042193de19ad3205fb3c8dc1d88483ea81fe3ba52e8c691643c46fd6dc3ce1aae75c51cbb58d'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
