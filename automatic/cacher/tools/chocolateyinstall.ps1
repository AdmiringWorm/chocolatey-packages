$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.4.4.exe'
  softwareName   = 'Cacher*'
  checksum       = '9f053a333508a73c0802cc1c2a20d3e781016c74419d745dea393fe8c7d4321d6e82daeb1a998bc7a301c4a94d7cc67f0af0f5f14882b4e8c42837f0d7f9dc0e'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
