$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'b62c04861529b6861ab8f158342604a718286a045edab698912c96cbc51f0118b5cd05452be7c6ca6a3a82a63f0324722b6f104341d1195a757ba1a73a49f043'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
