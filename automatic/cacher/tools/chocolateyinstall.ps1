$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.3.1.exe'
  softwareName   = 'Cacher*'
  checksum       = '017a62d43790e96fa4e8d8113e616e7c9ac783c2ca95f03b0cb3cc8c0e7d883a0545e21674159f6a68a77e3f3c1dce19f5a5f1d039435da3e29825c17568c707'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
