$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://coq.inria.fr/distrib/V8.6/files/coq-installer-8.6-i686.exe'
  url64bit       = 'https://coq.inria.fr/distrib/V8.6/files/coq-installer-8.6-x86_64.exe'
  softwareName   = 'coq*'
  checksum       = 'e4a4ece9c3d9e138818645e148ea8baf67524f7a59effad35e9d9c9f561db653'
  checksumType   = 'sha256'
  checksum64     = 'c03eb2ec0dee3878446b76152e3ed1af475dbf80e72707b50a5c987dd3a7cadf'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
