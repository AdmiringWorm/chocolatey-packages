$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.3.8.exe'
  softwareName   = 'Cacher*'
  checksum       = '566041b6ffb5fd6f9a10c751c5ee743f3b4c97e4d6178d892b7bf28cf262b848134bf2b2660913e824d3b5bbfcc8b859181f4e0faa3b082697c9afad9488b344'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
