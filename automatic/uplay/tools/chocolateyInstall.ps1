$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'http://ubi.li/4vxt9'
  softwareName   = 'Uplay'
  checksum       = 'F8E4C47927006C4C60F63C93A38680FCBB551172FB6284DA8598A325630EB195140455E05A0FDCB2427B7168F63B76B1E77952A19691C000A5C9F3005F1359DC'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
