$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = ''
  url64bit       = 'https://s3.amazonaws.com/authy-electron-repository-production/authy/stable/1.8.3/win32/x64/Authy%20Desktop%20Setup%201.8.3.exe'
  softwareName   = 'Authy Desktop*'
  checksum       = ''
  checksumType   = ''
  checksum64     = '55271823250428d240843299f517289af20ad3644c150c0425bf416a10ad48b548585618d02700a70e6e575a392d3919a77638f2273564a38414539688c0d6ee'
  checksumType64 = 'sha512'
  silentArgs     = '-s'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
