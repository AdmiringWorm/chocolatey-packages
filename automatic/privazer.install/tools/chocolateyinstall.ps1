$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '1342960ba18e1f4b8902e136670962ca6d6d9544d4c985e712452d024eb1b666ecc109f4207e164670da564d93fd9e5f575aaf17e42e469bffab4eac64c0408b'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
