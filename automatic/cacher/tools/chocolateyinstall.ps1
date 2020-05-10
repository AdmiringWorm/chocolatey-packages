$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.27.1.exe'
  softwareName   = 'Cacher*'
  checksum       = '4f99284d5e35893a8bd7943af8ac0b25d5ed5c8a9b9ce675d40bb88b72c9a99de8a7da4f3cf533d22cc9f0a60662ddc00b30e3bd7eeba24a124cdf639efb5857'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
