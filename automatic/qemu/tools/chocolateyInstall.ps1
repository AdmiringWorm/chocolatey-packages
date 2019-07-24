$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20190724.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20190724.exe'
  softwareName   = 'QEMU'
  checksum       = 'b4fdf64e82634194c77ce35c932a370e5aa88e5f6f4caf0a6c6b67a635a48fe9'
  checksumType   = 'sha256'
  checksum64     = '318c270d3322d677335236b20371eaca27750e4f6b3bc4d89a2b5f94d20063b3'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
