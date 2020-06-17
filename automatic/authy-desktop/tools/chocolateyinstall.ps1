$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = ''
  url64bit       = 'https://s3.amazonaws.com/authy-electron-repository-production/authy/stable/1.8.2/win32/x64/Authy%20Desktop%20Setup%201.8.2.exe'
  softwareName   = 'Authy Desktop*'
  checksum       = ''
  checksumType   = ''
  checksum64     = '06a37d52e6f6f62789e214a2ac1cbe034593e0e3f54a8df5c9c1275dba6251fe6051cadf9b4d84f03944dd129f6cadd223643528497efae5adb0051b45950d7c'
  checksumType64 = 'sha512'
  silentArgs     = '-s'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
