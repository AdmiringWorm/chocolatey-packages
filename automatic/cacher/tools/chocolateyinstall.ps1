$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.7.0.exe'
  softwareName   = 'Cacher*'
  checksum       = 'c7bdaa1923323f2d3b3681ac259d8d1d14686a284b3ef269b14c1c8e6f40cbad647be0a09ea0658773fc86d3b77e19e94e05fc8b5f90c66cdb7ce1285a4bde92'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
