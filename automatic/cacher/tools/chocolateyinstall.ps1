$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.21.2.exe'
  softwareName   = 'Cacher*'
  checksum       = 'd9c3f76934b8dc35c2d09119218cd4b5ff8fb22ef287d89b8d1269da92b3f6688cbf7702332b224b90f11d8d9b9beb844c472989d95ea12446d58b02a88bd0d3'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
