$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.3.11.exe'
  softwareName   = 'Cacher*'
  checksum       = 'afa4e41c6cef3e28baa3e35ba326187f6e472aa2f6ea47ececff8f58dbcfd57a32275b2827855b3abaff74c1c930e756490953e68561153fd17b4c03ee792cbd'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
