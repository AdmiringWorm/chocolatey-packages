$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://downloads.nordcdn.com/apps/windows/10/NordVPN/6.13.13/NordVPNSetup.exe'
  softwareName   = 'NordVPN*'
  checksum       = '00A1900298D926818D5103562F511DE39B3015913AF5D69A1632C694C366F0941DAD1B46CF9C7D5E832855E20E57B8ED87A3EA668699FC7456B0FBB3488BA58A'
  checksumType   = 'sha512'
  silentArgs     = '/exebasicui /exenoupdates /qb /norestart'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
