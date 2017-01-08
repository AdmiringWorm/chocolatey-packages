$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = ''
  fileType      = 'exe'
  softwareName  = ''

  checksum      = ''
  checksum64    = ''
  checksumType  = ''
  checksumType64= ''
  url           = ''
  url64bit      = ''

  silentArgs    = "/VERYSILENT"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
