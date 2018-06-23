$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.5.7.exe'
  softwareName   = 'Cacher*'
  checksum       = 'd60a363c74b89e0a2b3bd06700adef2d878cb3dec722f2e36957b30b56c0e1b2f1f9588551f22d8e2903decdcaea96f2c5f4b29cce96a5e49bb3dbc3d2b180a7'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
