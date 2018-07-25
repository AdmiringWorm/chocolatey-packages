$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20180725.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20180725.exe'
  softwareName   = 'QEMU'
  checksum       = '61e4ed6385c5dfdfa82318665fcb352533d05b1edb5652d5ffeee2d50d888fbf'
  checksumType   = 'sha256'
  checksum64     = '4c89797688da1d3462a3de90142bffc843221b917fe9b9af2c2e836ac85c62a6'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
