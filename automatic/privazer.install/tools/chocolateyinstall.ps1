$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '1c43976f65b2573bde53b2302c8ae55ab7670112b687666d152ece98e9196e0985f67a2d79a71143b15f8ee729e345b12d3223b56d5d34329462b3e5a693de95'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
