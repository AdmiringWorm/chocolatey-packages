$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'http://ubi.li/4vxt9'
  softwareName   = 'Uplay'
  checksum       = '5CF4C1FA01E6808AA1DEB40531410DD97C418B448CFF1E23A10E8FB32B598119D18027B37C2F300D46344644F3A0F007C17DF60DF13C1AE9CA60966F2C514A14'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
