$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20180801.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20180801.exe'
  softwareName   = 'QEMU'
  checksum       = 'a954195770b4bbefd98bbdd287d862c998f76094d5e05bfa2adbbf2d536ec43e'
  checksumType   = 'sha256'
  checksum64     = '7bb69262add9651fc559a2a4f29c5daef90b28846145677e332e9f519c550af6'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
