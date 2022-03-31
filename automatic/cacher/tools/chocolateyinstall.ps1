$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.44.2.exe'
  softwareName   = 'Cacher*'
  checksum       = '996fbd17400cb9d83f9366d771a94b158fd5aa33213c708e11d284a127b1da4caa0b8fb338ad2600b7b9e26253aae57b709724526db36f6e9104d79efbca13f5'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
