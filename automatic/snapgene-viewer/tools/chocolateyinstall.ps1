$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.snapgene.com/products/download.php?product=viewer&majorRelease=4.2&minorRelease=4.2.9&os=windows'
  softwareName   = 'SnapGene Viewer'
  checksum       = '7db58593343d9a120f367969a04b345fb9e86489f3592b3c3c605638437fdd159af9fb2bf1bb1b556523a1406d28dc91ed87ef02b023ce49d4f519d22dbc7f64'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
