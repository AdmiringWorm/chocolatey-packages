$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.3.0.exe'
  softwareName   = 'Cacher*'
  checksum       = '0c5c2d5ef1a32ce3fa809126e18bb1f3507686e5b22e1adefa0e3dfec5a4d02c885a074cc00b2f3c9ed6e8ee92e2cf3e43ab213e271bdcbe5a1fe0ba723ef6c8'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
