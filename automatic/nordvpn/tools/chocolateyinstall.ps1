$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://downloads.nordcdn.com/apps/windows/10/NordVPN/6.12.11/NordVPNSetup.exe'
  softwareName   = 'NordVPN*'
  checksum       = '3E6A03A7F91831479CC6EC0FF1FB7D97350C1ACB9E38BFD2E611C4A748F4602DD4D8F4DC0F501EFE1CEE1C9E0E9E8857BA6781D68B4175D2116475BFF6C236E9'
  checksumType   = 'sha512'
  silentArgs     = '/exebasicui /exenoupdates /qb /norestart'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
