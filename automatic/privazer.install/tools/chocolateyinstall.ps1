$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'd0f0262fc1ce6b904c26d1c9d1973f3fa047d0e93a8f381eb889db0e1a198a708964451a30bd32c5442408fde50d9066b9ada3711e4eda849e744d282583508b'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
