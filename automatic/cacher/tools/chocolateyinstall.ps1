$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.47.0.exe'
  softwareName   = 'Cacher*'
  checksum       = '413b6ece0997f72bad49d533b82d557bd8253725e66282e1a3b9a589aa45f137e8908c6238e4c0387e513234aa357bf81536ad18977e3fd34a03976819c28b88'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
