$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = ''
  url64bit       = 'https://s3.amazonaws.com/authy-electron-repository-production/authy/stable/2.0.0/win32/x64/Authy%20Desktop%20Setup%202.0.0.exe'
  softwareName   = 'Authy Desktop*'
  checksum       = ''
  checksumType   = ''
  checksum64     = '145b0a86a562c8842410dbbdf545521a09745108e9df0ab8e6361cc0767cffe756bba466040e27080ee633a5e0389fedddac3e1ce6af7f522cad4b0ade4e00c6'
  checksumType64 = 'sha512'
  silentArgs     = '-s'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
