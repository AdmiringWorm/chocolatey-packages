$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.5.0.exe'
  softwareName   = 'Cacher*'
  checksum       = 'f5edae5e5fc65984a164b5941eaf9e50db92cd540c6473d23815de08f498b2cb22b5a4f9876914ddb13b328f9e72b1468cf51f349456e0cec9c6f2accb3ffad8'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
