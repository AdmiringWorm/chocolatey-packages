﻿$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.11.2.exe'
  softwareName   = 'Cacher*'
  checksum       = '81b22de3ffc6227df1fef6d018388a314db59cae6703190535906f4560a2b2266e0183276462442a6f01ce631366f344c5bebb09d0f1f78402780941ff8a9d44'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
