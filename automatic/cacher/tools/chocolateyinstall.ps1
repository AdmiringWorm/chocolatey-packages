$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.5.14.exe'
  softwareName   = 'Cacher*'
  checksum       = '0e85360cc362a80c904324566c78e8f46cd6b90547677813010e016808109ab4e6cac1ef471ce2be6bc78bc1c24fc6822f286514751e186141f2b940ddbad35b'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
