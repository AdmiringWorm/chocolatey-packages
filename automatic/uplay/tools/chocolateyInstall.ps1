$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'http://ubi.li/4vxt9'
  softwareName   = 'Uplay'
  checksum       = 'C57416C279CE602C076264023AB3F422CAE7020A6D572A02DF7D923E237F3586EC6C84A7372CCA88D3DCA89BE920051E9728494DF6FA928DF6E31861C07F020C'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
