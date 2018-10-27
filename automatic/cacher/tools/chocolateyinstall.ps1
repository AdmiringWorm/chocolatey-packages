$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.0.0.exe'
  softwareName   = 'Cacher*'
  checksum       = 'e182fa92ae75118bfc2bbc7ab2d770805d4de6e7859da7ae25f90d9135ee9d39cbf77d59f45d4a7d860d6cec4333ed530bda519a5baa7579797badcd2cd91cd9'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
