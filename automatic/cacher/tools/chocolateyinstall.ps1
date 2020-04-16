$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.25.2.exe'
  softwareName   = 'Cacher*'
  checksum       = '138876ed799fe7f5e4e5d164f4e28e753e4d979356f3dd4eb5b54eaa0140415b284da7d3b84428877a6bab37db50b88b02625af43e01633c177c6398472953b9'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
