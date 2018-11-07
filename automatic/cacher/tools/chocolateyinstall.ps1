$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.0.6.exe'
  softwareName   = 'Cacher*'
  checksum       = 'aaf4078bc8378a0c9111257cfcc59e691fc9060fee44bfa86f2a3b80f465fb67d5d8d1de55ac2c16aae6e51537ae361f11c222f6c305122cbfd42254f8feae3e'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
