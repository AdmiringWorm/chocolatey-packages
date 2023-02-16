$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'acbe531177936392c9396a645ab798792adf92e23d62c44584fe06366afbc342d82d2a7aba26f053d3553bca57a6b5a6781ea95de5a786cb6879db0c2de27770'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
