$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20190731.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20190731.exe'
  softwareName   = 'QEMU'
  checksum       = 'ceea6554dafe73db253a9130f14c9dd68a0b21fa2160cb70f5835c50dbf9726b'
  checksumType   = 'sha256'
  checksum64     = '39cb6d5cf4e2c7045bc2ee4d76017d00b860c7ca99ef3bc261a91373676b7006'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
