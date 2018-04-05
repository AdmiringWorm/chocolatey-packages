$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.3.13.exe'
  softwareName   = 'Cacher*'
  checksum       = 'bb899ad6887aec78ddfd6930a101e2fa2bdd99336dea77b022883118db07445901585ca5d6d8e1996700ab2dd73fcd73f820bebc7d6bbc462aa7f34dfbea45a8'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
