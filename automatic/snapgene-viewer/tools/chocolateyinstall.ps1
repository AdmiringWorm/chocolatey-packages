$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.snapgene.com/products/snapgene_viewer/download.php?&majorRelease=4.1&minorRelease=4.1.1&os=windows'
  softwareName   = 'SnapGene Viewer'
  checksum       = '2ce285fa09f57fefda187cce205d1553a847dc0d2ac557270bad4da94a7683b46758860997c90d8e27816c65a45413d2c37e00fdfe46d9da8c2be9b586607a95'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
