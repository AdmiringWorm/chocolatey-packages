$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://github.com/coq/coq/releases/download/V8.13.0/coq-8.13.0-installer-windows-i686.exe'
  url64bit       = 'https://github.com/coq/coq/releases/download/V8.13.0/coq-8.13.0-installer-windows-x86_64.exe'
  softwareName   = 'coq*'
  checksum       = '0b32aae5048a84c838c42fbc88feb93c1fd17afb92f1b5ab82b9e364f070a897'
  checksumType   = 'sha256'
  checksum64     = '717917b3b5c29b436f28d9b69f8dbf8751f09d1fa9d7376c3fc64ed4ab38a39d'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
