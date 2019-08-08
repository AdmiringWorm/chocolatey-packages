$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.14.6.exe'
  softwareName   = 'Cacher*'
  checksum       = 'b5a6c1862d5a135cb1b09ce40abd5e1cbe4f63759322b281b7c35622d8cbc5813d90073342c4fa92a9887b027a759ad4020ea2fb973b7f28f0402a1c2cbd1756'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
