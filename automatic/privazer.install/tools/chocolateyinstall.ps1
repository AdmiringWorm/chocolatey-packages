$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '1463a754d18300301d18384570bbc95c95e0d528a06212e62246be76b6d6965126915404fd914999f142a5a53d2c8539e0d51b333ac29f886d35c1ddcd6cd346'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
