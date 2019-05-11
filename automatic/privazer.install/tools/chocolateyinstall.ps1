$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'd608fa3f0a3418d70e470f55f4be441de6e3cc17611b35ccbd063410b38db88f58e501dd3c81b4f1b9e273946a0c57cb611fc149e3749306db5cb078bcb21984'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
