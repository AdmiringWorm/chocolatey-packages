$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '49933EADBB83C5EBE1095757E7087ABC12B3D8EA8B82FAA75E07C54B64125AF1E54997DDD2806100D06B7C86355E7CF495EC2EF5B15030D8E4C306A7BB93C07C'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
