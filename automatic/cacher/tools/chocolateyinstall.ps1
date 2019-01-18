$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.4.2.exe'
  softwareName   = 'Cacher*'
  checksum       = 'd179ece94fa113d1f794345ac93f0d82da110a316043e8293bc68ab4906e33396ba01e26b3164818b67f86653fb20f6ed95caff502e60c1adeeb3b845956f954'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
