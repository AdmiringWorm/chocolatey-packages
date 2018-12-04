$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.snapgene.com/products/download.php?product=viewer&majorRelease=4.2&minorRelease=4.2.7&os=windows'
  softwareName   = 'SnapGene Viewer'
  checksum       = '56d67a5b5e67943d42400cfbc562e4b992ef12e54f96e17eadb908e2f7ed21a8d39c57f324cf52ba7b71a497e9cabaca3f30b3f5fa8de747042602c59459c1f7'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
