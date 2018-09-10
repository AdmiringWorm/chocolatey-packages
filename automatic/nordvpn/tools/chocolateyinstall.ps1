$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://downloads.nordcdn.com/apps/windows/10/NordVPN/6.17.5/NordVPNSetup.exe'
  softwareName   = 'NordVPN*'
  checksum       = 'D67458B65F14121C2D2A92EE143AD592938A47BD7E288AB6BCC889E19369EED2CB7C066BF1A1450263781B1FD21CF32375F906024D5F7D45B551B2F820DEC09B'
  checksumType   = 'sha512'
  silentArgs     = '/exebasicui /exenoupdates /qb /norestart'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
