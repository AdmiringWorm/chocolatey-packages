$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.snapgene.com/products/download.php?product=viewer&majorRelease=4.2&minorRelease=4.2.4&os=windows'
  softwareName   = 'SnapGene Viewer'
  checksum       = 'd534bacdae63c18d43958924ece9123fff313261ab1e5727f439a6e3b1523f4bf481e8a81c5d78147fa3b5c97d6cb631b2886f21774a48e9514d1eaaac9d8fcf'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
