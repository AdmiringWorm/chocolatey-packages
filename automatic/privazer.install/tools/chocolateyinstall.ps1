$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/privazer_free.exe'
  checksum       = '1d905cf38b5be09d6c6ef8cb41e5f2f7e933a6266206a503b7e225ffab94cdfbc5c32a4041f03be45dd85a73b5de3b9ba32a8a3b5c1a324fd6ca7483c339c2ea'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
