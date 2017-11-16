$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/privazer_free.exe'
  checksum       = 'bea9f951a00963f1d37ab58efdf5b2a4c82d97fc1ca248bb31341aa9116981b2f92063e6eeff7d6d6213e05e4bee28be202db6484d0b780449578e0c6bbf6864'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
