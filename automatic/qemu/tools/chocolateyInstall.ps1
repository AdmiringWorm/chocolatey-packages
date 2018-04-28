$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20180424.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20180424.exe'
  softwareName   = 'QEMU'
  checksum       = '8091034f176e659388996ef77946b63889d46d5378670fc9c357f1073daab598'
  checksumType   = 'sha256'
  checksum64     = '7fe1f863f01e2421d9ff594cef0a6805300d4b1c06396516b92c931cfaf80697'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
