$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.6.4.exe'
  softwareName   = 'Cacher*'
  checksum       = '55c0dccadd0a33a13c06795e526f9c41bcedb3f2716c8de1b565101af8d5e94d39d91a42cd7f74e32ad67a15d93e69bef2ea27cc8fca03d293dcf8ea5008ce68'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
