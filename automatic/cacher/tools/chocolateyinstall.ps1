$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.42.2.exe'
  softwareName   = 'Cacher*'
  checksum       = '7b0799effd567dc12edacb622749425ba06c68dd5e8747e2e3a477d55b20777c9c4085cb73736263f483d0e66067dfc91e4bca70503a1d87a937c4f0d4acaf0e'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
