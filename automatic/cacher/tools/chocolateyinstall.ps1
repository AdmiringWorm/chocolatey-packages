$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.5.13.exe'
  softwareName   = 'Cacher*'
  checksum       = 'a92fd3f9046bb97564a5be24005647137d00a4c2aec8489e62b280de7687081ab565d8f92e8a9c25e480ec11e657f5c8bfaf5d98e672c3a3f52bf3e9f309bced'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
