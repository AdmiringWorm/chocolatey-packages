$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.4.3.exe'
  softwareName   = 'Cacher*'
  checksum       = '26d28d53a0e2b62aa2661db0992f0c91cd0551530aac0d3f30fb9f7a6a1d40d2e19020fb4b1893a0ea99fbb1880456e1438af66fbc841e687b3eee2fcd7e1d8b'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
