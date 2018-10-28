$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.0.3.exe'
  softwareName   = 'Cacher*'
  checksum       = '7270996101270347895ef285e22107c4538b94efc2214b536254cf8aa66c908a151094518bdd2f72b8f3121b1d31b10085af7acaa07961a5dc2769a77d5182b1'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
