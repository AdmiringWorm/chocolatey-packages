$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = ''
  url64bit       = 'https://s3.amazonaws.com/authy-electron-repository-production/authy/stable/1.8.4/win32/x64/Authy%20Desktop%20Setup%201.8.4.exe'
  softwareName   = 'Authy Desktop*'
  checksum       = ''
  checksumType   = ''
  checksum64     = '4543a9da8a2088da66cd9cd2bb67eee5362dca518e1eba375344e71d81727fef64dc404b3d74e323a7e736923a24361c4c375caecb758db5fea49f66ee7772f3'
  checksumType64 = 'sha512'
  silentArgs     = '-s'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
