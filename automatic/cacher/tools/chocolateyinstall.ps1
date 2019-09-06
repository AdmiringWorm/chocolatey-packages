$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.18.1.exe'
  softwareName   = 'Cacher*'
  checksum       = '4c1c1062b06b4414783680f93c3035e3da5c7d455a123dc6d07477e3fbb739b084b7c9ec8bbb842ed91586db1287c72e9f4ba44477272dc961e450cc3c25a0f5'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
