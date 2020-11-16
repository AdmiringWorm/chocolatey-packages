$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '1d67304277d3ad88dc3d8c09be11065aab3d97c78afdecc09420551dac0cc52ddb2f0814326745dcd2fe690a5609eaf30fd0a1b5c4e4c60a58ab36880407edcf'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
