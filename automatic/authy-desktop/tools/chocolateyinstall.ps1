$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = ''
  url64bit       = 'https://pkg.authy.com/authy/stable/2.4.2/win32/x64/Authy%20Desktop%20Setup%202.4.2.exe'
  softwareName   = 'Authy Desktop*'
  checksum       = ''
  checksumType   = ''
  checksum64     = '446e182d5b5650984d8eb8375ccddb40b5c9b65838084cf88f9e3195cc6d0467aae10c8225078c2ec94f3ec800328bf2475f3a6838986f91ae076e6bcfcbb116'
  checksumType64 = 'sha512'
  silentArgs     = '-s -ju'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
