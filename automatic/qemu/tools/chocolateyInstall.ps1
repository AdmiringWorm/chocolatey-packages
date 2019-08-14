$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20190813.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20190813.exe'
  softwareName   = 'QEMU'
  checksum       = 'ca21b0097ec7c5f4f82f223437a9aa7c4b4d1de1bb6f87d887abe9ee370e6334'
  checksumType   = 'sha256'
  checksum64     = '810fbee399bdfce33453641462700405d772164d2a2a961815650da4f2ce8ba5'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
