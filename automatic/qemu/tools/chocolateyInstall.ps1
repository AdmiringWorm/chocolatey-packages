$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20181108.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20181108.exe'
  softwareName   = 'QEMU'
  checksum       = '0d1ee0ca453058bf4c00be7422d6254479e9b8bef968b7668e8a6de723c9b2c6'
  checksumType   = 'sha256'
  checksum64     = 'ee1e7853b160bfe7207300e65c9394f53f4537bc05967bb00c997d9da0ff1ac7'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
