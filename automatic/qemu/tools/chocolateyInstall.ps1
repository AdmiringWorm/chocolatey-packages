$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20180430.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20180430.exe'
  softwareName   = 'QEMU'
  checksum       = '9e11a79e7a09db4293b6a9e8f27e4f347575d471222088b228c6b77814fab5bc'
  checksumType   = 'sha256'
  checksum64     = 'c0fc75cb0bd6092e4cbde372870a38fc472597e24bf3c83261b25136d2d26e15'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
