$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.15.1.exe'
  softwareName   = 'Cacher*'
  checksum       = '8e08dc1fe250240e13f974253096566a25eb224c66a6400d3b62335f5784ac8cc96d440121f5b404ac6e6c0ba12952fa9bbc6ceeb4fe4df9e7c96adf236fe3ee'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
