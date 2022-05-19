$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = ''
  url64bit       = 'https://s3.amazonaws.com/authy-electron-repository-production/authy/stable/2.2.0/win32/x64/Authy%20Desktop%20Setup%202.2.0.exe'
  softwareName   = 'Authy Desktop*'
  checksum       = ''
  checksumType   = ''
  checksum64     = '15475887002f78aa75461a56c06550bd5077edb41395db1e470d487a88e9ae5344775711c014c52095cb892c07d7706fa08dc060a24b4ffa81a9d64819f33182'
  checksumType64 = 'sha512'
  silentArgs     = '-s'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
