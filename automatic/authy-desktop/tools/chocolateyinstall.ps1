$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = ''
  url64bit       = 'https://s3.amazonaws.com/authy-electron-repository-production/authy/stable/1.5.0/win32/x64/Authy%20Desktop%20Setup%201.5.0.exe'
  softwareName   = 'Authy Desktop*'
  checksum       = ''
  checksumType   = ''
  checksum64     = '45254378fe2d5d99974329987ca189acff4117d008d47c9ded413ec8d49829d3018a436e798d327da3064b89414be5789b43a83017061b0b6d619bce964d2166'
  checksumType64 = 'sha512'
  silentArgs     = '-s'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
