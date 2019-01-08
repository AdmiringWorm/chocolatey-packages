﻿$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.3.4.exe'
  softwareName   = 'Cacher*'
  checksum       = 'ce2d3dd4107a5627a32f677f8969d827cb172aec00bf23543b8850bac4ca389fc4f9de21f9135b5cc8778737e25385f10bfa1e0df6c16c877f28b41c94f6e807'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
