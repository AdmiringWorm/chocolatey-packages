$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'ec8460523510a13375908b34f1dd3ae1e3470cdb222690f651c06d0d53ce9e2e4eb36b9d33692b33e3f229fd9b418013df8d5f3fe741f90748071ff2b1fdd9f5'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
