$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.6.9.exe'
  softwareName   = 'Cacher*'
  checksum       = '9cfd43468d2707dc8d0ac42fd95fc732ffe0e7408ee698e14fe1e54feaa0ed18e5a6e1a6a52cbbdce3bdd4a1b1f9b887a850a86e0342d91ec3d4f3adb92ce27f'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
