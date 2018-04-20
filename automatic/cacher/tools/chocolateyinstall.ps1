$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.4.4.exe'
  softwareName   = 'Cacher*'
  checksum       = '332e2ce34d93afd6ec528905367272e40ad3f1828a40643776175f533ef807a309e4c87ee0e533b1eb17c8886dd270d22d37aa21a61b09aaf6c69b4455a84d0a'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
