$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '8cb09d7657c4dfd027caccfebee3dd0150ee3564b4aa65162d249bf64a65fc688dbd23745d4088cca76e9de169138fb970e41aecc8ec12bde9cecc6e1f130981'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
