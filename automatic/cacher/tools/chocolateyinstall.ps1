$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.44.3.exe'
  softwareName   = 'Cacher*'
  checksum       = '8aa8fc720354e25fcc71dab482c4d7a8587d77e6ecfe203678528b537b67f7d4c69dde334de38ef7e8e346bf03f999dcfa4faf712d7f61753180094e44b41dd4'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
