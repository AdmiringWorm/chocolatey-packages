$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = ''
  url64bit       = 'https://s3.amazonaws.com/authy-electron-repository-production/authy/stable/2.2.1/win32/x64/Authy%20Desktop%20Setup%202.2.1.exe'
  softwareName   = 'Authy Desktop*'
  checksum       = ''
  checksumType   = ''
  checksum64     = '23b2505a2edd4d702b46307c3eadffa3105838a6c259cc66d52935c07f311c308f70218d7e061d08b331d0d7aeed7d9ee3b847ec70475d4d1b849c93f259f4f5'
  checksumType64 = 'sha512'
  silentArgs     = '-s'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
