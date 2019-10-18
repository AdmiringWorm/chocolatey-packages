$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.21.4.exe'
  softwareName   = 'Cacher*'
  checksum       = 'e4d0741b529c4d5de56b510ea9d08e8226fb4fea8fd66876c77cd179542312a331504bfe23fcfc583d3d36c5d7f0a08b523f252dca2bc37e712eee6a7bee4b1a'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
