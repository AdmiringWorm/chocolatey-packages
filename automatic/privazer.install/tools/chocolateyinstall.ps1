$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '90a8a4e3634ddc7f4349c5d918fc7e200d7b6976ab4535b9e7e40756e186c90cc45a82677183171342967088f5296367247a363c951d3727cf179da186201523'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
