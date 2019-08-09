$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20190808.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20190808.exe'
  softwareName   = 'QEMU'
  checksum       = '77f5fda918430e2ef31f1fc06b6278720bd6dc5433ccc02e1b25ee699bb576cd'
  checksumType   = 'sha256'
  checksum64     = '9fc54d8edcae124fab3167d9aa1ba7affe1dee6e0045e871137ba2078523d82c'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
