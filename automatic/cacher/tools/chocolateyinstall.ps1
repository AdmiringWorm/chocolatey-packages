$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.5.15.exe'
  softwareName   = 'Cacher*'
  checksum       = '08359011e5b173702b2e6b9858f12ea272ef8d6ab083f3c1da849ddd00dd786f32dacf73872daecd7da65af76d713405c0a739a7b36232cf3ca6f365d8d6e8a1'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
