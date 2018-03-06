$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.snapgene.com/products/snapgene_viewer/download.php?&majorRelease=4.1&minorRelease=4.1.7&os=windows'
  softwareName   = 'SnapGene Viewer'
  checksum       = '3b2e4f8fa96d8864ac64005d4ebdf800d23aa89c996377cbb510c967b097cb45016655b709685e5d69973da7f3d386fa5fc1e7c3f6dd352f3fc331c9f8089945'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
