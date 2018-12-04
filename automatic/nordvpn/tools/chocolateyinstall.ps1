$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://downloads.nordcdn.com/apps/windows/10/NordVPN/6.19.6/NordVPNSetup.exe'
  softwareName   = 'NordVPN*'
  checksum       = '02225FA181F9F4300CFDEF46483252BEC9957F9FE544E5CD5D80CCDB0444178FDE61DE2D8154FE616526F7EA53BD30A9B7FF3F87ADEA34D9D6939872F139AC5D'
  checksumType   = 'sha512'
  silentArgs     = '/exebasicui /exenoupdates /qb /norestart'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
