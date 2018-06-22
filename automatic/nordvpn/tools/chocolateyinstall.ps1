$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://downloads.nordcdn.com/apps/windows/10/NordVPN/6.14.31/NordVPNSetup.exe'
  softwareName   = 'NordVPN*'
  checksum       = '2C8E1EFB02588BD37414A0257255C1814366F6B060DAEDC5D0B741E22558B1AACC8842A8DBF2861DC0EFD4D4C9AB83246F3BEA8C646E275416E72B1D8287009D'
  checksumType   = 'sha512'
  silentArgs     = '/exebasicui /exenoupdates /qb /norestart'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
