$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/privazer_free.exe'
  checksum       = 'd9f291369477c4b11629a06ef86309a33649e3f9871b6b481f242de92d7bf4cd8534015ace5fe6b0dd274dc33b0e7d98fe7b1d372a2088c9ab15c7f4bf46b758'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
