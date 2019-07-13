$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20190712.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20190712.exe'
  softwareName   = 'QEMU'
  checksum       = '2f50bc206514b1d666ea3a85564da4427fdfb7f1cae24e9ae1317f5ea9a0dd46'
  checksumType   = 'sha256'
  checksum64     = '17d9674137f94a8ef7778c2cfa75560b0a7d4d995dbb91abfafc46a3216fb7d5'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
