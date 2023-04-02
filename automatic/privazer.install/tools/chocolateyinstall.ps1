$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '40c0fd628d3d69a0f7875ab7cf58d717c797745422004c07e174debcb0d3c6068eaaed817a9256fe113e0dd5bc9eb15594e8c6680a948e5509d7253eb12a1ca3'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
