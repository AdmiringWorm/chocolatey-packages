$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.3.5.exe'
  softwareName   = 'Cacher*'
  checksum       = '25c4c7dba0d4a07df85d6f6f0bfeeb7d2b714169cc26316d785270b72ecd34fa2cad129a430c38608f371b9dc8b93d344bb8d74533cb6f0fa079d06c63b67b12'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
