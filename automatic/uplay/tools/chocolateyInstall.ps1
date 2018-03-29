$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'http://ubi.li/4vxt9'
  softwareName   = 'Uplay'
  checksum       = '52C4DEC4BC9B388BE033C13D3FEFF7EEA0F9A87EF3D076F2C826EAE2011D7826F2217D4FBF5469D1F5075D1F5F782B6B02E286B0727D5FC2D86963D3D2DD0D85'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
