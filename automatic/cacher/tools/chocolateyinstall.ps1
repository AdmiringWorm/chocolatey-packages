$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.5.3.exe'
  softwareName   = 'Cacher*'
  checksum       = '40b49359d70846dde8d168a2d4ca3850723023c41bd5cc99b31b4b410941ba4f094aafa7dbb3a31e4b67ca8095b314b4cf9e4373b7230d3ca7ea678ae5c479ca'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
