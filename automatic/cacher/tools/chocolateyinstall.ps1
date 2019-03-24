$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.6.8.exe'
  softwareName   = 'Cacher*'
  checksum       = 'a9f408fc215ac164577c57625fc7ed37ef4deb3cd49c198d1e281b1592f54c34a6a02d7b19c2f8362b675e318a65e156e963091f16612aca0d28c79111938b4d'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
