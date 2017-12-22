$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/authy-electron-repository-production/authy/stable/1.2.0/win32/x32/authy-installer.exe'
  url64bit       = 'https://s3.amazonaws.com/authy-electron-repository-production/authy/stable/1.2.0/win32/x64/authy-installer.exe'
  softwareName   = 'Authy Desktop*'
  checksum       = 'fca42d6a973578e2f5c56d35b8bab9873051c718f9f87dcf656ca67c5162748e64dba87e51d9a6f1874b15dd668532f67098669bb5806450e2de7f6adaaa7169'
  checksumType   = 'sha512'
  checksum64     = '77c6d13fb1cd30f6a913e725ce58769d381a5ed20b70b474c96d73bd8f38e45bef051bbfd1da8bbea8523170425bf7569f6d60be6b5ba34983d6f9dad88934a8'
  checksumType64 = 'sha512'
  silentArgs     = '-s'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
