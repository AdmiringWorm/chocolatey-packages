$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '70e80530ff6da4a3796692d5d4e8c0f50793bca7e0eee966171b166b48eddb18f6d75dc4e751b71cf45d36f3381d3a19a2490f01bec9f0d4de906d4170d25858'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
