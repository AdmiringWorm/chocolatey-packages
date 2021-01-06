$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.39.0.exe'
  softwareName   = 'Cacher*'
  checksum       = '536fe470791d2d9536cc7039b2a8f7a83b67ea1cd77ca936100201c4b658979fb54b60528f829e7d02d5b9aea2dfe8ef695a1084781bc951dc05ee1c31fcd027'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
