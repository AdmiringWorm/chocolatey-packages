$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '14cb864d78c4dd04c96927e5e1897e2d0ed413248278aa8cce93ccf9ae514912bf9e6434be6aa7b37ef4d8eadb588c64938fbb90a931280c1f6bfda43239da77'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
