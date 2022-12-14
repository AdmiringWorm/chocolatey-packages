$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = ''
  url64bit       = 'https://pkg.authy.com/authy/stable/2.2.2/win32/x64/Authy%20Desktop%20Setup%202.2.2.exe'
  softwareName   = 'Authy Desktop*'
  checksum       = ''
  checksumType   = ''
  checksum64     = '73581b12a08d89ba74770b37617b339e2afda71ab7b8fc797db63bd9366305c623c5eb1bd35e9b9148019e3509d6a8fe4efb3c583a151557064b51080d731ed4'
  checksumType64 = 'sha512'
  silentArgs     = '-s'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
