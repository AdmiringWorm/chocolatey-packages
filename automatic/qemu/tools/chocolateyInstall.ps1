$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20181211.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20181211.exe'
  softwareName   = 'QEMU'
  checksum       = '07093b8b8cf063c3a96f145668a6264598e756dac9a40fd725b8fed9c34dd439'
  checksumType   = 'sha256'
  checksum64     = '0d4f824cb436f0e13038d750b1065197a2027386ede2326e0bd62a0a0702b228'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
