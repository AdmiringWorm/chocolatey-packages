$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '5f34e1b0ba3caab2ec27fb25e3f2087251180cb0a7c134e0fb721fcc77d5d21239146b07880a9e1bf55df34159a658b4d63f47b46da37555c9024d902c27c4f0'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
