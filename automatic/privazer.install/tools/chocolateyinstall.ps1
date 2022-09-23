$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '4b7c97284199d9240a25382270d1d8b95a3c14f336ca51049a8c8fc3f69d8a23ee89c27295e8c7e733ad62c8481aa1790ce736bd3a9e8cd0feabbb03e090b70f'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
