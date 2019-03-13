$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.6.4.exe'
  softwareName   = 'Cacher*'
  checksum       = '7163e49c8cd71c5dca6dc45f1644150405232c66a4a88aa93dd57fab74d3fc19c9eb68b7802b5fcd05e37bd3ba2d50c617f11cbab16ba0c82b7c96c5fa6ef5d1'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
