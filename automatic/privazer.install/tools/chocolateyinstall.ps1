$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'e5774521a16c1ed8a4b982caca217eaef250eeae47f1a6cab187ad3298aeb08b4ea22ea4ed3d411c1bbd55d3242e548da86670b02619628d527fd09b90140ecc'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
