$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'eec092eb93f519b03f18a2dc43c48e1cb7b7daf791e4cfdee8785e0d90b3507a5ffbf22cd775d37ea9e71cc72cb4c7b7f62d3d4c4929f5a889e1c763d0b157df'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
