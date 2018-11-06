$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://downloads.nordcdn.com/apps/windows/10/NordVPN/6.18.9/NordVPNSetup.exe'
  softwareName   = 'NordVPN*'
  checksum       = '7733A1F5B93DF0590C82671AF2E74FCAE89D3B833033E7DA18D4BA6B6A8C567D1220962F8DBAF3DF15D184206B9B2D08CB52748BA60DEDC65BE61EFEF6525502'
  checksumType   = 'sha512'
  silentArgs     = '/exebasicui /exenoupdates /qb /norestart'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
