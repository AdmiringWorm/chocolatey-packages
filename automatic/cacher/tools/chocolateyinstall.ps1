$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.30.3.exe'
  softwareName   = 'Cacher*'
  checksum       = '4dc4bec99baf5496bd9081ad58948f647a5cc9671c4bd5c6586101920a5c77f83437ac0b04bd9756c2692bea3e7c576d051428a6ae736859d4f4a4dae8b6b1c4'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
