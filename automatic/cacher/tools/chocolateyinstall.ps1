$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.10.4.exe'
  softwareName   = 'Cacher*'
  checksum       = 'e76d43d245b2b2926676e9f270cdda5b31f821e8d0e5109a590be0bb2dd33e09e921175a5b3addc0b9d54f961bd2024ece98d800af5a30c4c98a5d084c6cccc4'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
