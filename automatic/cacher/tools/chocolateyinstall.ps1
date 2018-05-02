$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.4.5.exe'
  softwareName   = 'Cacher*'
  checksum       = '86dc78a422f7e54c137e5fdbcd2f339b60a79457902f4458cd74d889c6e6ccc0562eca5d8af095858758feee74dad03b610d4ca444a7354125a8550c20c74a90'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
