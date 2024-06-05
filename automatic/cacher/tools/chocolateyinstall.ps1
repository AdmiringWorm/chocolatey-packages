$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.47.4.exe'
  softwareName   = 'Cacher*'
  checksum       = '71f34e02cd0cbd2ad78b90245141bf0286b8bcc0ea426e7bdf6990f563a9c0a7abeec2e67811b1db6e77089ea035861ec0d3f95e6c1848889dee421014697457'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
