$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://github.com/coq/coq/releases/download/V8.12.0/coq-8.12.0-installer-windows-i686.exe'
  url64bit       = 'https://github.com/coq/coq/releases/download/V8.12.0/coq-8.12.0-installer-windows-x86_64.exe'
  softwareName   = 'coq*'
  checksum       = '519b17b4c9bd893cf27b9228dd8359a104ba10159a4a8f90c55a33632776a3d9'
  checksumType   = 'sha256'
  checksum64     = 'e957be5a013669215639e34f954727824f385b785d0e2a8bdf08a6078c26c1a6'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
