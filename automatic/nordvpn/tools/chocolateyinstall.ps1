$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://downloads.nordcdn.com/apps/windows/10/NordVPN/6.16.9/NordVPNSetup.exe'
  softwareName   = 'NordVPN*'
  checksum       = 'C7ED63D1E20B13D476E5463B1A93857F800DE0BC83B548E6A6777B0B50F4AE7FD157E473BAB84D47D7137B19F9EDD9DEABE5C2496A7857A3A4DA1D0FF0CAA729'
  checksumType   = 'sha512'
  silentArgs     = '/exebasicui /exenoupdates /qb /norestart'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
