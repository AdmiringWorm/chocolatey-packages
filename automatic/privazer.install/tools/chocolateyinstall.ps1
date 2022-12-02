$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '0f1b760ef599ef1772bd1aaaf4baf5db9530f42c4bb3e48b678522b340209a39d608843764e8c9589d4a3d6857f495b05378aa0025f7c970a03d25766acd5652'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
