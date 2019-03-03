$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '9e926cb6f94dc7ccdc902c04a0e6d3da484df4563c9fdb08d9c57f47ef51fce08cbd4e71336d204e894998253591f2e12650f3e759846a5165d575f133a05148'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
