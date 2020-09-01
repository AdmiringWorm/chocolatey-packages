$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.32.6.exe'
  softwareName   = 'Cacher*'
  checksum       = '5ee609b4e1615b126f52b03a85dd8f82e28c9401addf0d2641bfd4a77d7e41c86346b6648a2f6e7056c892f99e7692fe77ddaf77cb15b71f1cd0826a687849dc'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
