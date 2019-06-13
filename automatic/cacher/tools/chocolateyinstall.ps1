$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.11.1.exe'
  softwareName   = 'Cacher*'
  checksum       = '0eb3c1d412083c093ec77e28901d0dab67b1746cbc962abc2085f6d0e9fdb33d9c13a110a07b1354b1d565423b4e5eb715ba7c9c9f4e7be9a1b9e6707ae42548'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
