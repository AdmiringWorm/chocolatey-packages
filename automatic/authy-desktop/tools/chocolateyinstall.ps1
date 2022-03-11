$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = ''
  url64bit       = 'https://s3.amazonaws.com/authy-electron-repository-production/authy/stable/2.1.0/win32/x64/Authy%20Desktop%20Setup%202.1.0.exe'
  softwareName   = 'Authy Desktop*'
  checksum       = ''
  checksumType   = ''
  checksum64     = '41efced1149f8b5229b9a1f9a6282b11827ee00678f1484a01a8c08c6cd24a51a392200bbba000ebb2fada3aa73e91d1693e681d9d32934ab2545027db0a1580'
  checksumType64 = 'sha512'
  silentArgs     = '-s'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
