$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/authy-electron-repository-production/stable/1.0.13/win32/x32/authy-installer.exe'
  url64bit       = 'https://s3.amazonaws.com/authy-electron-repository-production/stable/1.0.13/win32/x64/authy-installer.exe'
  softwareName   = 'Authy Desktop*'
  checksum       = 'b4e98f21f998758a57a08027e2f171c2285053b882f1e9d90da03a768eeb6cfa'
  checksumType   = ''
  checksum64     = 'db1f0d2f3630201638cb7c1f6616229d9f033c4dd690fa17d06019608d1f065e'
  checksumType64 = ''
  silentArgs     = '-s'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
