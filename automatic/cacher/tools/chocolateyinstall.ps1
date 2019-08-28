$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.16.2.exe'
  softwareName   = 'Cacher*'
  checksum       = '9cf0a87e61da484123a952b0fc31a9ea98881b0cc99e9d18f8a81675629530768108644fd780fa9887c51728e26f0f5cc7dc647fe969634eac20caf0f86e6e6c'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
