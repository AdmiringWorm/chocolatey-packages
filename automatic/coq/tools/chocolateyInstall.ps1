$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://github.com/coq/coq/releases/download/V8.10.2/coq-8.10.2-installer-windows-i686.exe'
  url64bit       = 'https://github.com/coq/coq/releases/download/V8.10.2/coq-8.10.2-installer-windows-x86_64.exe'
  softwareName   = 'coq*'
  checksum       = '04372c3407f4abb7f48d098d57f299be7343f2d345a7bc82fc2a3d03622b9b45'
  checksumType   = 'sha256'
  checksum64     = '4febccc360a273ea4e2de93412d9c9c1880550d03663c73e0b980b61f7d489d9'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
