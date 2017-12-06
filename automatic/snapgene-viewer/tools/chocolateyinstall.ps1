$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.snapgene.com/products/snapgene_viewer/download.php?&majorRelease=4.1&minorRelease=4.1.2&os=windows'
  softwareName   = 'SnapGene Viewer'
  checksum       = '665db57596f69549dcc65bf3ea932400a40ac08c93fe70e7844e8390499f4306b184d7ed2c87a1d3c33e2a3a39d75f80dc2b0302d54dc6fea69c2e80e6b10eff'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
