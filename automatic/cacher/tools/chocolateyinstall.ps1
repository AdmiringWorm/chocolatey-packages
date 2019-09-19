$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.18.2.exe'
  softwareName   = 'Cacher*'
  checksum       = 'bcf3b5ccc79c9d8e3993b88d7dc70a2afa75c922807802b30bdc1b690dfd364416ba96946ac141e6580224e7822c6defaf119e5257b15096493811fdeba76ac9'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
