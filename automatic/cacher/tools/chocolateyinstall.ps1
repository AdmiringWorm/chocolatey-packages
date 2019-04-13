$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.8.0.exe'
  softwareName   = 'Cacher*'
  checksum       = '68640b745aad3a9d374038c374f7b07f6d8c42136e82fd8c98b111d56dcb4d9c852e784a83ba9b01ff8f53d833da480296f8732db1e24cc913e07a93fa05f8d2'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
