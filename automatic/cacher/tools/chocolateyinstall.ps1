$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.30.0.exe'
  softwareName   = 'Cacher*'
  checksum       = '0cc2c684ebce8b89c8ae8ba27057caec899b9f2b602c0c41044b5e4963582bcf2a78b8eb1c2073a46ed87f7ce1085834758b2bafc39f8bd2a0b8d1b734d431be'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
