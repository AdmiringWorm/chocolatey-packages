$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20181126.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20181126.exe'
  softwareName   = 'QEMU'
  checksum       = '83937c818764ac8bbf85ae402e8c270b0385f8e678a3186d785947b847d3588c'
  checksumType   = 'sha256'
  checksum64     = 'f18e9a5c0fbc32c512d3464b1c220e3a93234c3bbb82e24869a3ae9de9748be0'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
