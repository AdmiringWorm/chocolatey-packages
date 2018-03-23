$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'http://ubi.li/4vxt9'
  softwareName   = 'Uplay'
  checksum       = '8DF34F32454D87CDAA5A38781A99FE10132CEAA23896D1015A088B8AD06CA4961AAB3A8AAAA6D3641E00A52943D71D098A03C9FF0E6989943C1C9866124BEA2D'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
