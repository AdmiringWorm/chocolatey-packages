$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Authy Desktop'
  fileType      = 'exe'
  silentArgs    = '-s'
  validExitCodes= @(0)
  url           = 'https://s3.amazonaws.com/authy-electron-repository-production/stable/1.0.13/win32/x32/authy-installer.exe'
  checksum      = 'b4e98f21f998758a57a08027e2f171c2285053b882f1e9d90da03a768eeb6cfa'
  checksumType  = 'sha256'
  url64bit      = 'https://s3.amazonaws.com/authy-electron-repository-production/stable/1.0.13/win32/x64/authy-installer.exe'
  checksum64    = 'db1f0d2f3630201638cb7c1f6616229d9f033c4dd690fa17d06019608d1f065e'
  checksumType64= 'sha256'
}

Install-ChocolateyPackage @packageArgs

