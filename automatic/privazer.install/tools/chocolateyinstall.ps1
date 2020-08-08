$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'e3d2768ddd4360a65bf77ff6cd1d4ed391ca987ea2e265c2cc555bcbff2c3b7c52e22182122d4511ccc5e0d4835a266acf987e89c9dfa4a2d441907eba925dbd'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
