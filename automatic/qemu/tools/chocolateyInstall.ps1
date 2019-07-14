$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20190713.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20190713.exe'
  softwareName   = 'QEMU'
  checksum       = '55a3f993678cde4055ebc5d77bc6f537ebb7cc515c9b05a57dc3524b559af603'
  checksumType   = 'sha256'
  checksum64     = 'b99a4d43bc449650e78b8e2943300dbf7b6b37b7f354a1beb2b2401ea3f3aac2'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
