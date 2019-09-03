$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.17.3.exe'
  softwareName   = 'Cacher*'
  checksum       = 'e81388c5490740cef582e322c5f44fa730e6fb7cec1d070a5fb1e4516ac9e1de9f1334b7460ca27692a1975b248a8eecf65e99d371bde24820eebf7b63a4f84d'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
