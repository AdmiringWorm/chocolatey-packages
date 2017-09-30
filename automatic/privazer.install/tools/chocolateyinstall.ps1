$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/privazer_free.exe'
  checksum       = 'a4a8b5fbb5bc660d043ec6291de346cdafebe1f25f89c89449df75c15b8a673e4f54765eaf292754b044b55dc69eec3a0fb060efa76777b486a4d2c869d03076'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
