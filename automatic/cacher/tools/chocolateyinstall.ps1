$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.6.2.exe'
  softwareName   = 'Cacher*'
  checksum       = '1ea4b5d8aa73641429107b51047d215f77e1523c91684b0555c79c909bc1fa2e91d70e7b9fc13d7bc59653ab32910902fe9779e762e7ffa2949bf85576b3d8aa'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
