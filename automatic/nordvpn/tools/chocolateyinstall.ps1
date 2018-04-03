$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = ''
  softwareName   = 'nordvpn*'
  checksum       = ''
  checksumType   = ''
  silentArgs     = '/exenoui /exenoupdates /qn /norestart'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
