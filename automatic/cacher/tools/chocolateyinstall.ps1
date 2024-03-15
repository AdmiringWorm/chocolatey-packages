$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.47.3.exe'
  softwareName   = 'Cacher*'
  checksum       = '17d522fbd3bc3e125b9e7124c43201f3fe5e95f801d37f7a119aa52ebf2bc7529a18662d7443016425fd70c7e309d538c1c370f70e2a4939c16d4d3fc6e9e2d7'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
