$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20190717.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20190717.exe'
  softwareName   = 'QEMU'
  checksum       = '8b1d26d710971d3b813f344789a9b46a535190da0b39015fb8c7995182be89f7'
  checksumType   = 'sha256'
  checksum64     = 'f76dcf9eed6118600e2d02750885114348b1cd079e96c5492befee66ca277ed6'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
