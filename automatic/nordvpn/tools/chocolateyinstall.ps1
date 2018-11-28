$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://downloads.nordcdn.com/apps/windows/10/NordVPN/6.19.4/NordVPNSetup.exe'
  softwareName   = 'NordVPN*'
  checksum       = 'A83A0E0B7F53058BD7FF5067C2854E9C6C38EFE6F2972319CC6B0A38F46B45A6737A09EE1D860B0E49A6B1ACBF5EF75BC8266EBA422167EDE4C7B89018D23145'
  checksumType   = 'sha512'
  silentArgs     = '/exebasicui /exenoupdates /qb /norestart'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
