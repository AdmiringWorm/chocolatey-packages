﻿$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.10.5.exe'
  softwareName   = 'Cacher*'
  checksum       = 'c7e855f89f09e97939f7ee1d561daddc41d07f69aad340c1cc2f37ac6658b5a5f2a0cc961a35999f148098a41fa9adaaa9079c659ee0b21264ed7d2f51a4af06'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
