$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '6824eddc582eeac7ecbd57a68f9aadcdd196111cf0c5444ff657719409d4ba8f3368f98c3b6a462ef9e09a45a1180d931dfc2059a1a3f7d2189f1086604f2239'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
