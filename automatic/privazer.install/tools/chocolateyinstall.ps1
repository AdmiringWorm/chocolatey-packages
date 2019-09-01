$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '366ea49021a4772c39fd32929952839937acd923af81e544248ee0e28f87dcbf4cf754fc70d0b4c405ba2b4272f2c32e2c7bcb6f7581117a1b4e22a96ca0080a'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
