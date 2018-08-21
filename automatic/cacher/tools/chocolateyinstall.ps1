$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.5.14.exe'
  softwareName   = 'Cacher*'
  checksum       = '23880e8833bf0e8ee419dc9b45cdf72e2e9bdcdad2f14b95717c8432f1bdf08b5eb5205ecfb8282b4f83574bf65f4a28ed2c8f0295c6416a8d7c2a89aa949725'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
