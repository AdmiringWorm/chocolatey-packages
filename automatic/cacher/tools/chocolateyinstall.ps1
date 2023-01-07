$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.46.0.exe'
  softwareName   = 'Cacher*'
  checksum       = 'eb7f9e1220d16f8556b9f4ae0e84746a3cdd2e19d65e372aa746e5b76a2f9fdce7dca105ea155d9b3bf113ba5d11b21ff53dd06028cd6c055a6b702a6dd2354f'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
