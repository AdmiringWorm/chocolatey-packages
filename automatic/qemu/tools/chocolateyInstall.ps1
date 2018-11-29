$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20181128.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20181128.exe'
  softwareName   = 'QEMU'
  checksum       = '90bc45f50d6d53804a9c89bce460b7751331ecd59ffa946bff77b5bfa2bcc36f'
  checksumType   = 'sha256'
  checksum64     = 'c2286dc73fc1f7f0f274725ab73e713681f7b9eb049e654995dc0879262a409f'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
