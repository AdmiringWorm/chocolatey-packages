$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.8.3.exe'
  softwareName   = 'Cacher*'
  checksum       = '6ca8b495391bdaa2941e431121632c41434323a8b4bad506735bd63588edec67c311233e22308f6117453ee58171d8a82b33a3d3bbcf2c1ef35d6e0aa8048de4'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
