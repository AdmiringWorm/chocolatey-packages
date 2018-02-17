$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.3.2.exe'
  softwareName   = 'Cacher*'
  checksum       = '11e1e0f3dcea085b8dbbd9e0e78fdbb71f08db0aee1c0bccf8ab68652cd9ca6c97f073b4273ce607a7565f3c6ee316ea2f0882c3ddea13d619cc00ba3ed70d0c'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
