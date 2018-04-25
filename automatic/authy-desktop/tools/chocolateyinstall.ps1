$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/authy-electron-repository-production/authy/stable/1.5.0/win32/x32/Authy%20Desktop%20Setup%201.5.0.exe'
  url64bit       = 'https://s3.amazonaws.com/authy-electron-repository-production/authy/stable/1.5.0/win32/x64/Authy%20Desktop%20Setup%201.5.0.exe'
  softwareName   = 'Authy Desktop*'
  checksum       = '7afcda97b9d0c924d3f260a83f10371a14130142eeb1a9e20e68c7c7f5d51eb26d62a139669597182e22eb95653ad0e2a08febae21b5e1e02e2805445a5a379c'
  checksumType   = 'sha512'
  checksum64     = '45254378fe2d5d99974329987ca189acff4117d008d47c9ded413ec8d49829d3018a436e798d327da3064b89414be5789b43a83017061b0b6d619bce964d2166'
  checksumType64 = 'sha512'
  silentArgs     = '-s'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
