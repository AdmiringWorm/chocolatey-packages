$ErrorActionPreference = 'Stop';

$packageName    = ''

$url32          = ''
$url64          = ''

$checksum32     = ''
$checksum64     = ''
$checksumType32 = ''
$checksumType64 = ''

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  softwareName  = $packageName

  checksum      = $checksum32
  checksum64    = $checksum64
  checksumType  = $checksumType32
  checksumType64= $checksumType64
  url           = $url32
  url64bit      = $url64

  silentArgs    = "/VERYSILENT"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
