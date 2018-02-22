$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.snapgene.com/products/snapgene_viewer/download.php?&majorRelease=4.1&minorRelease=4.1.6&os=windows'
  softwareName   = 'SnapGene Viewer'
  checksum       = 'a91a74029887ca716a7750f862afd47920c8ee9ba4924815f1893572eda54656f9fb3eb9168da096c2aef09379e7f96e999fa828cd45043dde4303428b6f0e3d'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
