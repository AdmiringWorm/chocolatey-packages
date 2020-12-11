$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.37.0.exe'
  softwareName   = 'Cacher*'
  checksum       = 'e5d530adf2cc479ffc3a9c6cfe58d09b9df6a1375a62af3fb6a39c01723f20dd5340a1eee8d1b2662aad245e76150c81145b4716225a48a822cacb2cd7500a13'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
