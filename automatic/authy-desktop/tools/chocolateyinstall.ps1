$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = ''
  url64bit       = 'https://pkg.authy.com/authy/stable/2.4.1/win32/x64/Authy%20Desktop%20Setup%202.4.1.exe'
  softwareName   = 'Authy Desktop*'
  checksum       = ''
  checksumType   = ''
  checksum64     = '2e0e6c353666ee46ecbe69e765c7cee30b8268232ef288929215cede6f3bd9ab2ed79ea8651cdd2a70c2166683e7df23f577dcf22d79ad03f30a8b01d52aa55f'
  checksumType64 = 'sha512'
  silentArgs     = '-s -ju'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
