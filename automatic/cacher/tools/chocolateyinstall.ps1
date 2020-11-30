$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.34.0.exe'
  softwareName   = 'Cacher*'
  checksum       = '661fdde591aa00cd439b6941a6dea6292ba0248412ef846891ebb2cc85fe603bc6f49e0f6454b4edabc4dc286eb2d229029870e3d20711603bf6925c1cf1dc70'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
