$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.31.2.exe'
  softwareName   = 'Cacher*'
  checksum       = '345f0f69bb4ab8f346c198cce1e43459236ff6820d8697be8a979ced4bedc26b056b35db002f156822de38b63995c9418b40fa03f2a4048fc9a10e2519990d35'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
