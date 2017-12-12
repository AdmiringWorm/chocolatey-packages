$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'http://ubi.li/4vxt9'
  softwareName   = 'Uplay'
  checksum       = '2A24D42EE80EF99C4C0DDAABD828E44A7282136CB52E9B170EEB93875AFFFEF6E1BDF966159B862E2A8371221C2AE2F58E49594D1E7BADBCF8321ACB25DF9348'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
