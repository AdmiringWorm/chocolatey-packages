$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20200201.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20200201.exe'
  softwareName   = 'QEMU'
  checksum       = 'c148a192e795d3f4b29e0bb7af9e8ae8bef26bb45cf9c16effb23827282ac1d7'
  checksumType   = 'sha256'
  checksum64     = 'a9e46bd76e5d60472b0102f5b84bc9736dbfefa08c396d3f0aa16312727209b1'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
