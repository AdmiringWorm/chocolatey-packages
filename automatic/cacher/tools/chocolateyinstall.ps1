$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.19.1.exe'
  softwareName   = 'Cacher*'
  checksum       = 'c3f30e59a44c988e306544f6dc2803d4a71a0d493058068146cceb58d38dcda84c0b4003497214416a1072cf6e221cb8458ef7ed1c090a9f48ade337ae0261a7'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
