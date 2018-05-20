$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20180519.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20180519.exe'
  softwareName   = 'QEMU'
  checksum       = 'e3bb1a66a25022709b7a5154f19617980df13713edfcf89e18743a05ca16dd4b'
  checksumType   = 'sha256'
  checksum64     = '8ebc485a6eaccfd36e64fe972f73a6f67588f9636d66e8c8e058f8403e0fa7d9'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
