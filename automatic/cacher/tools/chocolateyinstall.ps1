$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.5.6.exe'
  softwareName   = 'Cacher*'
  checksum       = 'dd1cd2d017acc99c32c8dd6040479849e5b7300c6b1c1bdde7e82bd73f7b9da6025cc10895abcf9da055f4815951005952553dea847b4e98950faf883de905a7'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
