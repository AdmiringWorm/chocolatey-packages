$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.5.12.exe'
  softwareName   = 'Cacher*'
  checksum       = '194e7ac55b95110e2fabe30fd4ca334a3b22c77f093e7374fbd385ec717c6136210c4a52efd289bc8185590e710e52702480c0d1ebccf5766a041b6d0b9a7ec7'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
