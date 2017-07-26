$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://coq.inria.fr/distrib/V8.6.1/files/coq-installer-8.6.1-i686.exe'
  url64bit       = 'https://coq.inria.fr/distrib/V8.6.1/files/coq-installer-8.6.1-x86_64.exe'
  softwareName   = 'coq*'
  checksum       = '0183a773ca32f8709125559d7878557d63b6df1a2616ebaf65a26fefd8ed7c3d'
  checksumType   = 'sha256'
  checksum64     = 'c6da8b192c17b15e858bb9647456a822f5755eca8bca96fafe9d17dd4441d6a0'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
