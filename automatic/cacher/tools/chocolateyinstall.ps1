$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.17.2.exe'
  softwareName   = 'Cacher*'
  checksum       = 'f7ada88d4542cc45ec06eb3df61342d3077cf209ce87e6c0850a9514c72278eee91a02c93e48c51579035057fb766a8a157e3e1380e652b5310c9ecc7d4534dc'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
