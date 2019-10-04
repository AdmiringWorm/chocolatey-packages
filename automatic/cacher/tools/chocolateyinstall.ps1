$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.20.1.exe'
  softwareName   = 'Cacher*'
  checksum       = '8b262020f96c22a854872d117dca9f636ea9fa716c206093a5a32b7d7dd2f6b9e9a1dd17bf4af2636a436b8ec68ae2969671f5d7fe56598954db11430fa4ca82'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
