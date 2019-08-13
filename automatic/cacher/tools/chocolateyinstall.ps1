$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.15.2.exe'
  softwareName   = 'Cacher*'
  checksum       = '1b0a35b1772915f9b8330d02d3f45a134c04f08ba3847d40cda0a711869a1f7ad849889e2b4cb085583b84c7edf1860462edfd631655f8402afbf44cedbcd033'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
