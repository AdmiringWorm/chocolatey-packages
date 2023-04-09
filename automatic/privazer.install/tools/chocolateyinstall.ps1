$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'c251db2c72af7b3cb6a820354ae718e33aa762c50c87e2482637e92ebd8ce6901de2662234c8848a89094f2dc2969b8feff83168c12ce77557b2429ad5d81031'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
