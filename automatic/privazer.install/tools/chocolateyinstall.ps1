$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'd957fc7e56f6cd4894863791526b0518693847a0b063e4324718feeff38bdeee70e75c3276df57428b99d7ed9020d3bd1ecb0b01165f12645c6a2b837fbfefa8'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
