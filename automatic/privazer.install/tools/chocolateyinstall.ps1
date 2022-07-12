$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '5111891d165b8129ae24ded93887d07a094575e0412aa312596c24c5388e542523bce1a178863caf9127e933d3d9a44bf4ed2a240f12d2e7582871946b3fdb11'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
