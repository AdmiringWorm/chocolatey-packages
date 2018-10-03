$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.snapgene.com/products/download.php?product=viewer&majorRelease=4.2&minorRelease=4.2.6&os=windows'
  softwareName   = 'SnapGene Viewer'
  checksum       = '18605559dbfbe59e098618bc10d0dafcc02e89487fe4d6e79c617dea9e20cdd491ee5551f3fef12016d3f31a53f24d7ad888106514ca76945777a0013725999c'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
