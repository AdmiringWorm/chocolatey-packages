$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.38.2.exe'
  softwareName   = 'Cacher*'
  checksum       = 'd8d00f117c0f1a4262b9eb81d859fc306943155acecde5d637ecdadbc856bd2a8c545b6b008507dd6c0c990e029a00bdc56f97bd475e3e49050c1f02455b46d9'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
