$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.5.1.exe'
  softwareName   = 'Cacher*'
  checksum       = 'c638381ab4102ec29328cec62c02e065234b172629633b1c9c8382dde44034cd98128fde3ff35e9a78c9e448acbfcbf95a72c5af85176a62c90c8d0a5e624b29'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
