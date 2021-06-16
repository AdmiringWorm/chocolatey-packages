$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.42.1.exe'
  softwareName   = 'Cacher*'
  checksum       = '09e52e199345c00e5192efa72ecaca45b4d4516d1f7d730529754f6f2c490e67469e9144900ce8df6827c09454421c6c5b159312bf38e822bd7e2084c8ddcae1'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
