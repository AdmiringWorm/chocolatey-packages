$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.12.0.exe'
  softwareName   = 'Cacher*'
  checksum       = 'c7e25ff6ec7c22dd6f656ecf8f4c80acccb630f346c35c7596c8be921ea708d9c73f02cb0d1e291f8c52c4163967973ea41af94efc219e725fdc14218810cd96'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
