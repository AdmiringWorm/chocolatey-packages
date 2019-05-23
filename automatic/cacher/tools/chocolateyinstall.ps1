$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.10.3.exe'
  softwareName   = 'Cacher*'
  checksum       = '15d20695348d87952e1b662cb293b2bd4090c8bfd21c26253d3b7ea2f7a4e7cbda002d183e7323428244c81f36c3b2b12a6793cb5b1b7ade7d359bbc316c618d'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
