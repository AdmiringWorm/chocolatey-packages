$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.32.4.exe'
  softwareName   = 'Cacher*'
  checksum       = '1a25c2d03891335d5558aef09f5c8089ce00096c81b59e8d0781b167b051b2bbf24563ae069305a7024a69b30cd585dfd88042b0452f67ac45f14a87c37502c7'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
