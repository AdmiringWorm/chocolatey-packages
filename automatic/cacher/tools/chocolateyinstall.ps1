$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.9.0.exe'
  softwareName   = 'Cacher*'
  checksum       = '64a2872ad2f07a79b75876dbb61ece0c56ee5fbd296a807b513d4fd123397f753cacec1ba069e56776e5f8a0951aceed48187916ae7bf9228fd1d72a67b18046'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
