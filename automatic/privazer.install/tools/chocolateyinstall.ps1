$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'd46a87d9610b3196a36f49a81009cd3b676cf2fa498cf230329564fb7e880f89ec3748dc46e067a62aeab3a0f1b563f984e93261e7d979443263e3e3bb8a83d3'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
