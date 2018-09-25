$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.6.1.exe'
  softwareName   = 'Cacher*'
  checksum       = 'fb893d44d0e936dacb4b3b299556a6add5e417843af30fcc278b92b02d1ef86e514abdbcdb07561d509ff54cbb4d1f66ee6f7be2fb0f33b646749b4ec8ceca9f'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
