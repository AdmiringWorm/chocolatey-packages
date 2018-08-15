$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20180815.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20180815.exe'
  softwareName   = 'QEMU'
  checksum       = 'd90770104d552092c25b4e575c6e87a03436faf6feddea23c227027935076aff'
  checksumType   = 'sha256'
  checksum64     = '4e2ab3b53c89289b1b775f9db05ebbac541a8f7fdc7ec424874f5de83e091097'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
