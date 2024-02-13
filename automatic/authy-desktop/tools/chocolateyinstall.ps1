$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = ''
  url64bit       = 'https://pkg.authy.com/authy/stable/2.5.0/win32/x64/Authy%20Desktop%20Setup%202.5.0.exe'
  softwareName   = 'Authy Desktop*'
  checksum       = ''
  checksumType   = ''
  checksum64     = 'c1a4c7819af7b4d2ea4caa6a20f6dd4e530d9d946c4f1911f755586f46919abe14ac0a0b4ffc0214cdf54dae88235ed25e96c06d46e7018bff8bbcf59ffbf0a4'
  checksumType64 = 'sha512'
  silentArgs     = '-s -ju'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
