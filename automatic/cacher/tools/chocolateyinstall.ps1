$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.32.5.exe'
  softwareName   = 'Cacher*'
  checksum       = 'd37bc7d49b74c87fa12b114180795c81931e6138ab36c3cd425ab9c984ee6fc57fafbbafe9d29ebc51226e03e23976c406e56f86f5aab01debad65c84512b3bb'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
