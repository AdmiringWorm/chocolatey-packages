$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.10.2.exe'
  softwareName   = 'Cacher*'
  checksum       = '6ecf4272407f30d0cc6b3b02368fb34d0dae80cf562aa97c6829f1daf223e0cd92e4e5f56bc41c7e983ff1a9d83f485462a1fb3ae93027845337b154adefc196'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
