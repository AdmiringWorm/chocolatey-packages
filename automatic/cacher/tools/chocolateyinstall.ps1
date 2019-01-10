$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.3.6.exe'
  softwareName   = 'Cacher*'
  checksum       = '1eaa2057c85abc80b927b888c2db79c714981f44cf843f9e36857ac443370f408f9f01831fdcb946e6b8fcbdd924812d2a700f89c5e69baa7859b241127e9dfe'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
