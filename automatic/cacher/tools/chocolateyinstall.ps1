$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.6.13.exe'
  softwareName   = 'Cacher*'
  checksum       = '26dab7db5002533d0824778f0f840797bf80698aa0614443d40a8610c27a492d27eb1a75179505709236f833439193073c0f76f18c30da930988b69bc03407e1'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
