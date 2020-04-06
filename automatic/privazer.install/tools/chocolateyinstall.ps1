$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '10ad95794ff3d27f5de6dba174358d6348e927e92f2c914e1d94260d302f6ae60a6ca7c604dbe6340408d74a12ea7a9187e3a5eb93d4b29bf68cb88bc7eb1b01'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
