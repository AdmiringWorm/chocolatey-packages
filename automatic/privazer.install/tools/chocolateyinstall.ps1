$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'b9114c7a459b26f17de77e0ee3f16c1ed6e4e9f7df79066530fefd726176a7842ec2f74095e13d6819d5e2c6f80bf6dde52e9842c03a7051a5724c7b7066259d'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
