$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.21.3.exe'
  softwareName   = 'Cacher*'
  checksum       = '5c7ea51d5b105a70dc9f78a91de595a49e011b5a50cf7a01a7f9869d4901371efe9a58eef2f5b01ab8ec097391699b8b517445a43e9cc5a3a86dfddbb407f457'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
