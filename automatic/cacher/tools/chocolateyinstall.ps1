$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.1.0.exe'
  softwareName   = 'Cacher*'
  checksum       = 'e33e912ba9da630af7492c70564cdcbbbf93050a2682ec19b66a8d8ab473f8d5cc39426323ca1d85e0ce02f9fdfb2b0760be4059c713d11f47db461905f3888b'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
