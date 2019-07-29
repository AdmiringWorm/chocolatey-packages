$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.13.2.exe'
  softwareName   = 'Cacher*'
  checksum       = '73c0972b0bf85cdc90ccb4722fe017d7167825d3e445cafb05ac0a94b820cde2fdea3119a1ed570a4be962c4d80f345ca71fca860580b921efba694019f761e9'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
