$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.14.3.exe'
  softwareName   = 'Cacher*'
  checksum       = 'fc16a2baea9c09314dec8ab354ac38ef0fb949bcbb9eb4354690eb2bd4147a7bfdb4a2db6d1d8a485d1ccd4b092de9fbdb678e373838bc0055488509fe0e764c'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
