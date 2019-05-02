$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.8.2.exe'
  softwareName   = 'Cacher*'
  checksum       = '144af819b4738e8bb80372979a061e79d5817f379d362262e62445efbd92020c6a1fc45795d55a5f201e09206f6704202dd3ae42f9e3d4eba879ac868ea2c087'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
