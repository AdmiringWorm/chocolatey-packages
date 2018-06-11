$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'http://ubi.li/4vxt9'
  softwareName   = 'Uplay'
  checksum       = '3EFCE6BB03596C36518F3B63DBA280ABBA585CC0090CE1AA721363D4483DBCB193C2085F428102032426208032C80A7AE6E126004A2986E366C7230F8E8F4A1A'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
