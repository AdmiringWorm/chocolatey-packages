$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.31.1.exe'
  softwareName   = 'Cacher*'
  checksum       = 'ab877d2affb2bf170ff12ac86226541654384f98c38611d3927978edcfa668adf9f565e576fb96173e54d8be945f1b15cd3cfe27e30893d602b9579383c9a196'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
