$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.13.5.exe'
  softwareName   = 'Cacher*'
  checksum       = '4b775f9199f21e7a54221df367f8ebcba69c9122ddbf3f35bc920ba5f9ace3de9791befd870bb5237a2c26c716c03136af685bd9de62881df43e22cb2c600967'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
