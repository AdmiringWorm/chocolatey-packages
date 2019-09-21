$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.19.0.exe'
  softwareName   = 'Cacher*'
  checksum       = 'ba2628a841d77c806d00c232c1779bd5f518eaa4887c775278aba590dece42a19d83b12c2e84c44833ca3783d160faee6aadd8773c6057cfd7de4b7892a791c8'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
