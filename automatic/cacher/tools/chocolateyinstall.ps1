$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.33.0.exe'
  softwareName   = 'Cacher*'
  checksum       = '07489bd0c855a77ff0ed49460246b52d63e67c14a535e59035efb701211c1578b85f439876d9aae9b50918934c9ceb91909fa079cb15afc64a1caf5f286bd833'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
