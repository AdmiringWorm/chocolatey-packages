$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20190815.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20190815.exe'
  softwareName   = 'QEMU'
  checksum       = '69d7c697d6da686c9a62c7fa3d1f01f7250a52e604ce3605ebf1d11265d1b567'
  checksumType   = 'sha256'
  checksum64     = '2d12e840a4e704202178150dcabbe13f327dbd5e9fb83970fc81b97bdf08c083'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
