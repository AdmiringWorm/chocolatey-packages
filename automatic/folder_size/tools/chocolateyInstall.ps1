$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = ''
  fileType      = ''
  softwareName  = ''

  checksum      = ''
  checksum64    = ''
  checksumType  = ''
  checksumType64= ''
  url           = ''
  url64bit      = ''

  silentArgs    = "/VERYSILENT"
  validExitCodes= @()
}

Install-ChocolateyPackage @packageArgs
