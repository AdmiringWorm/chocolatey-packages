$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.6.7.exe'
  softwareName   = 'Cacher*'
  checksum       = '6c436f4fd49dc7e8603145d0d51903ae4f85ec928acfd599a83b041355d95999f5afa42a4d5669f4c788f93568b300633562478533e28f66d7ff34f14dc067d5'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
