$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.snapgene.com/products/snapgene_viewer/download.php?&majorRelease=4.1&minorRelease=4.1.8&os=windows'
  softwareName   = 'SnapGene Viewer'
  checksum       = '5bef9e7e34244c617d7efd51f01344096338b76608dae787bfec013469a2a90481d31f62b3d577008451f95f8983e453bb0d2136e1d5c3c86b0453a519d47fd2'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
