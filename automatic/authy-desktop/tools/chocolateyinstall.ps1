$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = ''
  url64bit       = 'https://pkg.authy.com/authy/stable/2.4.0/win32/x64/Authy%20Desktop%20Setup%202.4.0.exe'
  softwareName   = 'Authy Desktop*'
  checksum       = ''
  checksumType   = ''
  checksum64     = 'e5f83bf78cce07fa7329fe0478f2e67437ba5526a86a9e1559d86e1b3533d4a6a59bfeb5eaf0e22db2f18447145480feb872a1a5508cdbf3f1122e493f6c7263'
  checksumType64 = 'sha512'
  silentArgs     = '-s -ju'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
