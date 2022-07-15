$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'd76347667c92e63cdec9c84a61027cfec32937bc7aa27371edf638a49364481f2f348acd819f29cb1925dad2e720c53c06f62d2098f40256bdcf8e04b117cfbf'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
