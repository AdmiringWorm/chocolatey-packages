$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.3.6.exe'
  softwareName   = 'Cacher*'
  checksum       = 'e70791ecbcb581ab742182e6a7617455f502b90bf21c8cd887ea22facfb0a15495d9b5e4803a52f8a619f91f33a341c216ecf38a44993c1be6ca7b30d55f85ad'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
