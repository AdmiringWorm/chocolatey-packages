$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.28.0.exe'
  softwareName   = 'Cacher*'
  checksum       = '25d20109f641e4c3e45ff2eb2592310b63b63d5f269e18490376f1fde45b7449f59f97fab5021f09f89a36b4aa204d0e9112a4e1a151a14bf4e8263f92517313'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
