$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:chocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = 'https://downloads.nordcdn.com/apps/windows/NordLocker/NordLockerSetup.exe'

  softwareName   = 'NordLocker*'

  checksum       = 'DB0B40A54CF83A1CD040685A82374D41486903E430F0E3200AF69A40B357E113057DE13EE41C0CFE864BE64757E5BAB303FB1A2165C90AC2EBC8E29414460F5B'
  checksumType   = 'sha512'
  checksum64     = ''
  checksumType64 = 'sha256'

  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /ALLUSERS /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName)\$($env:chocolateyPackageVersion)\install.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
