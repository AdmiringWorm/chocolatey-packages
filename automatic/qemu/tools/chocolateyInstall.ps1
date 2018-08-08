$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20180807.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20180807.exe'
  softwareName   = 'QEMU'
  checksum       = '42c61924c8c4c0d094129ffae7ed567430fe4e76a2fbb44c68f9215d7a23c0b6'
  checksumType   = 'sha256'
  checksum64     = 'ae69863d7d215fb5f704e7780836ced75f7162bc52386e66e1b71fcaef8d9206'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
