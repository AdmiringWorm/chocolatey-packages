$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.13.1.exe'
  softwareName   = 'Cacher*'
  checksum       = '4e97965a8a8098df54cb05fa81f6aadddd6c56ae09460f5b1e2c7a11cc39f1980f8e31f0d1cd07e5a9894a628a039aad3de7d3db84f0e0d9e60feb83a4222b1b'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
