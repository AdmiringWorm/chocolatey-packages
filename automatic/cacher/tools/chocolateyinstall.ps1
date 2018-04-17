$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.4.2.exe'
  softwareName   = 'Cacher*'
  checksum       = '90ac85346544ed84d31cf1606fa8ac5b4d296233c827803c7cb79fdbd470fe619fa0c479e7e80144efe53f1533527ac501c9e2f8c4e608430fa70742f121bc77'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
