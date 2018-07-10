$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://downloads.nordcdn.com/apps/windows/10/NordVPN/6.15.5/NordVPNSetup.exe'
  softwareName   = 'NordVPN*'
  checksum       = 'DF88A140821E24843A39433AB64288096D18716FC517C167C0C614A85BC8A4FB5DF2C875F7CF469AAD62574D983075A6112794CA1F3951051E322FFB2B760943'
  checksumType   = 'sha512'
  silentArgs     = '/exebasicui /exenoupdates /qb /norestart'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
