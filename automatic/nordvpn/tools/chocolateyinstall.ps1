$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://downloads.nordcdn.com/apps/windows/10/NordVPN/6.14.28/NordVPNSetup.exe'
  softwareName   = 'NordVPN*'
  checksum       = 'BD429E5278D83D75F702F602A31F6FA3713534859ACE0FBE0243C2A435923850C92F1E80023B9FE9385D193E2D2D92B7BC8434B4664EA17C8D6F21BE6277968B'
  checksumType   = 'sha512'
  silentArgs     = '/exebasicui /exenoupdates /qb /norestart'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
