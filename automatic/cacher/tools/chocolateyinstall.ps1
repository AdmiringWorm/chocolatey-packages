$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.30.2.exe'
  softwareName   = 'Cacher*'
  checksum       = '1cd3df39f3b6fef040bbf96d817fdd06a5afd4c911254acf3b4334e882359a696b43fd6e67f4ae48a492eb8742cd8651815f4519ba72f4f96f24e30b4d3a47f0'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
