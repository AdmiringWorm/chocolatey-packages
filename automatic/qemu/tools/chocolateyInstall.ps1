$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20190807.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20190807.exe'
  softwareName   = 'QEMU'
  checksum       = 'd603742598c5cc43247938ff43bb659ede380020915a822f00783849668a2cf1'
  checksumType   = 'sha256'
  checksum64     = '06831b66f6d9b5f5599ce3386195b4e240eadcd915551a01d6f80b4cadb73a3d'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
