$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/privazer_free.exe'
  checksum       = '97fadf8ab307ed3261f9a7a60ad57f9d891a9d51abdfa2d926544af0bca2c029e22e438c44f7343ad4e8f71c5854a9328d2e7f11dfd1500aac9d1c50b5173ebb'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
