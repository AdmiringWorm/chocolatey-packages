$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.32.0.exe'
  softwareName   = 'Cacher*'
  checksum       = '2c877f4e0e3ebbce19b46547100d4d90e392afe89f5b4276cdd57495d1cbe517b298eee8ceb6d4d926fc072f0e8ba32cdef04ac5c20b15646546d89b3961b1d9'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
