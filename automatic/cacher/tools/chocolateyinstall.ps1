$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.0.2.exe'
  softwareName   = 'Cacher*'
  checksum       = '8e653f5d7f73f0f25b17fa2f047305bb8fc03464b8af1a56081c8fb3d1c49469d1e6b1cc7cc4f46e86e3d614e81d21289d01635962edd1880d65cf910ff035b2'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
