$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.25.0.exe'
  softwareName   = 'Cacher*'
  checksum       = '0f370176ebc49c2566bcf90972d148ecb5e9e7596ad0e16f332d16fe0febb0560d38eb3a5301b0e481cba63411e430d8e708a2d931eed4ff2cfd7e0fc4a5f14b'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
