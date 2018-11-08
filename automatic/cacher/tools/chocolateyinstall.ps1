$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.0.9.exe'
  softwareName   = 'Cacher*'
  checksum       = 'f5d6a9afefe161fd20cb81fcc2b3e352894a3c0c3ebd218a3f7717ac5004abd1081ba39c7073b990f04d52d401487cf497f4ef5d94eed21d91ff7d875330b196'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
