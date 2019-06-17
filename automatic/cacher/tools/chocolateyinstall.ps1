$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.11.4.exe'
  softwareName   = 'Cacher*'
  checksum       = '5c095b4473879fe080c6a4adffef43f9d9178ff1006433c45fcf9c3b1771477835dbd6627eeb33e26a0384dbdde2e69fbd8caf2067f7d655a247bae76c1f6de3'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
