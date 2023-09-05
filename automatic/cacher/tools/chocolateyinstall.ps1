$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.47.1.exe'
  softwareName   = 'Cacher*'
  checksum       = '9553cc40516d7ca3ce188762eca09d6bc113a7372393fd5d4c6b13f0690c17aad9b40048b4faa304d4b3489bdd14fa128bc79d78e6a84e663f9f8838c42cf8b8'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
