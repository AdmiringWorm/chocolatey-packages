$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.13.0.exe'
  softwareName   = 'Cacher*'
  checksum       = 'efd7ab71a062f0198445a97e98be5250c331ad7b1a295a523dab19ba0ab048d960a911d2d4f550ed6e58e833d9aa24b085fac54efd6e5318bd3bded221b99a38'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
