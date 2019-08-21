$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.16.1.exe'
  softwareName   = 'Cacher*'
  checksum       = '45b70e04736ca11d2159f7212ed455c60b904ca45b538d63f6b939f0b76c308e1880fbbf6ece68c3ef7aef7ce894bb35305d0db97095dcaf3a38e90068124d05'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
