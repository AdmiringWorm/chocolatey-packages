$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.36.0.exe'
  softwareName   = 'Cacher*'
  checksum       = '231f625b94cc3ae71a76a79f3a2386c76c4669565932c70dc7dcea88476d2f72ba99661eb2e8786524c63fcd59f6b7dd3ed79ee70fbaf17d16a3e332f4939a2c'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
