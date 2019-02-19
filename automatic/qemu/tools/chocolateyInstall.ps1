$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20190218.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20190218.exe'
  softwareName   = 'QEMU'
  checksum       = '2cdff09a1a8f458d3c5a6b40f139bfde3f1b95602c5c9b3d4d172a2491dad3d0'
  checksumType   = 'sha256'
  checksum64     = 'fdd1db3b00b9a034faa8611a1af966cb17ec4233ee76c951e68425e18ec51d6c'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
