$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.6.9.exe'
  softwareName   = 'Cacher*'
  checksum       = 'a3a1927d507d6ac687b084342eb33bb68c15a51f2e9a9925ab1427239814022d6015b44c8a5f50512882cce9131b4c8038b5b340a632f425a540b5ebc7222c67'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
