$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.21.0.exe'
  softwareName   = 'Cacher*'
  checksum       = '9260d517d3c69da961f761e9b283b25b80166d165ed282a3f8f4955117d70ae48a885a1d50f498f0e825c4442497f1eff83492d46475a35199c5bbc7d1b74e26'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
