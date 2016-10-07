$ErrorActionPreference = 'Stop'

$packageName    = ''

$url32          = ''
$url64          = ''

$checksum32     = ''
$checksum64     = ''
$checksumType32 = ''
$checksumType64 = ''

$toolsPath   = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsPath

  checksum       = $checksum32
  checksum64     = $checksum64
  checksumType   = $checksumType32
  checksumType64 = $checksumType64
  url            = $url32
  url64Bit       = $url64
}
Install-ChocolateyZipPackage @packageArgs