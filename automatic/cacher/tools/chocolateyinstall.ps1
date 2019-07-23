$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.12.4.exe'
  softwareName   = 'Cacher*'
  checksum       = '57db28887434dd2c531e2e31a7323a117a3fa4f1958ad9cb14df44a430cd5bf0ba2fce9ddf286e0ea9663466ab7631ccc952075259e77fe45b113594def61b7d'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
