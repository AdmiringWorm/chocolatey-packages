$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.6.8.exe'
  softwareName   = 'Cacher*'
  checksum       = '7e603a6cf30c8adca092d4eb0b1378ebea79e34a35a8a0ab89548870b89ca0e492ef03d330e84412585ba71138e24a6719bdef0d07af6e651118c20e6c5610e3'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
