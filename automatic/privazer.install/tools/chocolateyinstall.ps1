$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/privazer_free.exe'
  checksum       = '18c4aa6f1110c6c3c45e7c0cdfd489b25be2846dad4ce3730f3eadd49232bbaffe59840504e969aa9e813fcc5c7a0094c10d1cd025870712d65fcf92d3ffce86'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
