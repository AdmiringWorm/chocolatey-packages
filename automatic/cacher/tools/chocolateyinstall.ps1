$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.0.7.exe'
  softwareName   = 'Cacher*'
  checksum       = '8ed7a6a83ea02b1b78f68f750836e6ec96c1ae23f7963f284e6f7bcbb866dd39f89c89062a0f1b23a2d953fbbce756cdef33b9fd2b088e07bca72a5cbc9b0cfd'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
