$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.6.5.exe'
  softwareName   = 'Cacher*'
  checksum       = '5f50fa91c6310f877a8e491c6a309a4fc4b0c4645fd902aa50b18e900fa0b2d4e70221a08721da5cbc484491767d5216dee94ca914ddbfd16735f43fe1d2078f'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
