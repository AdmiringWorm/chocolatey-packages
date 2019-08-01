$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '661118cb9b91719851459857cd113a2b9a3bb573bacb055cabc84e198639fa64d0ae1dee34f5e7744922989b836b274fba983b8cc29627ed702d1ae9917f77c4'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
