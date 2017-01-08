$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = ''
  unzipLocation  = $toolsPath
  softwareName   = ''

  checksum       = ''
  checksum64     = ''
  checksumType   = ''
  checksumType64 = ''
  url            = ''
  url64Bit       = ''
}
Install-ChocolateyZipPackage @packageArgs
