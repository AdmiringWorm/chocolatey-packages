$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '1fac569aed514125045816dff5d3e27d7d0f47f52bf3a3d1f63688fae02c3c8f5f50639d71ce167017c2effa8b25a4e0112caf7c0d6bd50df7f02a79114fcd39'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
