$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20181127.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20181127.exe'
  softwareName   = 'QEMU'
  checksum       = 'abb74e12423d3f0f455ea23d91cad37d4f624087d6915e5b9e8a7e7bdd022a7d'
  checksumType   = 'sha256'
  checksum64     = '02280a1949cb6ab2dc98a0483ab67fb551a3b8d8ef98120973782efb2992f06d'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
