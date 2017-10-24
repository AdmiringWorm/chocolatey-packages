$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/authy-electron-repository-production/authy/stable/1.1.0/win32/x32/authy-installer.exe'
  url64bit       = 'https://s3.amazonaws.com/authy-electron-repository-production/authy/stable/1.1.0/win32/x64/authy-installer.exe'
  softwareName   = 'Authy Desktop*'
  checksum       = 'ad4f38a40a122cf3e42adf6c4ec3623f05eddeecfa637bd5111164ba9e2cfd578a12fda772909e49761b0145df9d9fadd6b9db9d8718f4d085daa4120959ee08'
  checksumType   = 'sha512'
  checksum64     = '818769f046fdec1bc5df92cc734ae73187a6a52626fb3d50136dc79dee75da15923e07e5e6752b4504fa18a5916e6c1cb3ef8cf70bd3600d81ea13e2d9b84ef3'
  checksumType64 = 'sha512'
  silentArgs     = '-s'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
