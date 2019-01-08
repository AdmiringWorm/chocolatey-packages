$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '551c04e1f4e72d88118b73d02bbc74474dabee716259f9ca27651fe866328531079e40a96ff89258ddce7807d51053bb1619bbe2e4d06f90c9ecb0095e41ed08'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
