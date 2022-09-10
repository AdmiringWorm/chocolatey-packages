$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.45.0.exe'
  softwareName   = 'Cacher*'
  checksum       = 'cf7b1a084b5b8b60a300d8bd44aa157b9b9056befb65e7a35bc7e39dc682de3be4fef340550270f1d8d0000e27996f12ba6f0544b4b4d0ca5f5c9c14edbec82c'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
