$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'f1fd4efeafb9772c46ce0a096f5191cc51ac402c6bec3b57a467f379a5e2147b5d5d470c7b8fa3ac1ef4e199f077a52dbee616dff3026ee36f7f34aeeb8cc555'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
