$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.5.4.exe'
  softwareName   = 'Cacher*'
  checksum       = '3d58ead3b0bac370ab4351f913bf0507930ccfb1f8362eb53efd84bed4136afc27829a977ae8cfcd12dd609899527a524982ae2c2ffa26a7d10feb5dddaf134d'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
