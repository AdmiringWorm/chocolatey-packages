$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.0.4.exe'
  softwareName   = 'Cacher*'
  checksum       = 'dfc4c78898b4c9a995a6621100d5507d938a1b4e14e3639a464a068e44ea8162415c164486c2258f97fdb2e7308d2974ddb10d1034816af573909feb9af8ceda'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
