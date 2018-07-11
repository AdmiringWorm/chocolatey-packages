$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20180711.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20180711.exe'
  softwareName   = 'QEMU'
  checksum       = 'ace7cb5495e1c5f6e0a07683d7f72a61b6b678a4de6939d27ec5b1398d018e48'
  checksumType   = 'sha256'
  checksum64     = '0f130c8dd507e2b6b2eb443c1488832cec36e970499e74a2dfcc1b3a110a44a4'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
