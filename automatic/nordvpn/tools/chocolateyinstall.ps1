$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://downloads.nordcdn.com/apps/windows/10/NordVPN/6.17.6/NordVPNSetup.exe'
  softwareName   = 'NordVPN*'
  checksum       = '0FBE55F8736C345AF67AB5D69940EB68DD71CFDD7C62B2E4CB91EA7A72212B501B507B69FEFE7D25E848668F86AE5B0B697D6F9933E60FE26EF9207D92DF7465'
  checksumType   = 'sha512'
  silentArgs     = '/exebasicui /exenoupdates /qb /norestart'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
