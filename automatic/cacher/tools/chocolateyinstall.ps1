$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.7.1.exe'
  softwareName   = 'Cacher*'
  checksum       = 'e4d306167cd8422b1be01405df4325bf17acc9bf4a11ee604331f0849de642d15ad2e760f3acae351b74756093bbfa3d5b3e04ef4517a66d5ff8d0702a240e70'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
