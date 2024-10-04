$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:chocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = 'https://downloads.nordcdn.com/apps/windows/NordLockerEvolution/NordLockerSetup_x64.exe'

  softwareName   = 'NordLocker*'

  checksum       = 'B5E8F00ECA04A25B19883417B1723CAD9465071A9B8C7B5688E677B055BE8B8EC1948F35E62CFCD3A60DB4920A8A86F5BE917F09A4D30D2A97D4754D50BCBBF7'
  checksumType   = 'sha512'

  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /ALLUSERS /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName)\$($env:chocolateyPackageVersion)\install.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
