$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:chocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = 'https://downloads.nordcdn.com/apps/windows/NordLockerEvolution/NordLockerSetup_x64.exe'

  softwareName   = 'NordLocker*'

  checksum       = '840E5113028780A7641FAE2DE67357520B51D2D4D98489704528C8EEFC9BCB276EC302D88D408D70F240F49F5EFEF0A470BF978E741F074DF20052D251BB73D2'
  checksumType   = 'sha512'

  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /ALLUSERS /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName)\$($env:chocolateyPackageVersion)\install.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
