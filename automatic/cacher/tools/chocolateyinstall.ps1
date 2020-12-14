$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.38.1.exe'
  softwareName   = 'Cacher*'
  checksum       = '7cbc7d33a7a5a6f434e9aff1472957f379349ee40b38d9f478490bbde4a6b27ba1347ef0754516d316396331ca650ec6f5ec660877361dea6f7238b1eb48b018'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
