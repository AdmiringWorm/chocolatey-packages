$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.5.10.exe'
  softwareName   = 'Cacher*'
  checksum       = '59f8cd57a9cf45e27b37040e8cf62ac7bc4ee35a1f1328c8faf9b8bdbc189f97e6505f8ee06896fd2f2c2b5dbf06baa650756542d6fe2f941134b985a6011e99'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
