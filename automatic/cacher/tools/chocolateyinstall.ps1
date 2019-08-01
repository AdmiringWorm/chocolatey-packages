$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.14.1.exe'
  softwareName   = 'Cacher*'
  checksum       = '02de0fb3f47142504e2f78e39a96eb6deb73cc124096c0390cc70646bac2dddccb476b25de96ff644fafe0b63bd7068e9ecc0553d3dfad9c8ca096256a27eaf5'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
