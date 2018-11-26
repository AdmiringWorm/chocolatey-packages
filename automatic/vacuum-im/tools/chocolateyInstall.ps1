$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'vacuum-im'
  fileType      = 'exe'
  softwareName  = 'Vacuum-IM'

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
