$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.22.1.exe'
  softwareName   = 'Cacher*'
  checksum       = '07778091ab4d15b24335248b3cb750f77735cbb29d288e36b718644c82457933c5515c684c55805bfc69582c21c888224fe47e8880fd0c69531eb92df0bad3e2'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
