$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20180718.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20180718.exe'
  softwareName   = 'QEMU'
  checksum       = '5ab38b4aa8cbeabd07d0b1da3f5368277bbb7973a78ed307c6933034a7b5f90d'
  checksumType   = 'sha256'
  checksum64     = 'd99c797f9441f9e62f35f2496740e6e59825a390f5442ce2e55ce9eefc692f0b'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
