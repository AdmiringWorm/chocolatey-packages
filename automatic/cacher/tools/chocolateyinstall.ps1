$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.42.4.exe'
  softwareName   = 'Cacher*'
  checksum       = 'd584d50b57cd473194f51336c9adaee340ea3dcd38a2f8035728bbb402b3b796277de72379d80a77a46e4dbbb4ecd282dc6fbc60ee19d964d603dc2ce50c9e22'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
