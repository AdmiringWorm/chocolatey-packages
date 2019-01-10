$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'the-powder-toy'
  unzipLocation  = $toolsPath
  softwareName   = 'The Powder Toy'

  checksum       = ''
  checksum64     = ''
  checksumType   = ''
  checksumType64 = ''
  url            = ''
  url64Bit       = ''
}
Install-ChocolateyZipPackage @packageArgs
