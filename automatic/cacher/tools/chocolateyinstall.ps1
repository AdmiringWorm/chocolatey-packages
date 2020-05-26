$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.28.1.exe'
  softwareName   = 'Cacher*'
  checksum       = 'c8ac20c95775f9fc7003a6592ddd59e66f69a2256eab7b6383b6b3933e95dfc3202d7c57b0cce443a98e33f4c655f62e8af3a458ff95827e116f6ae6f51694c7'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
