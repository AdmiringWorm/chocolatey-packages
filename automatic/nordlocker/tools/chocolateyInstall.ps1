$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:chocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = 'https://downloads.nordcdn.com/apps/windows/NordLocker/NordLockerSetup.exe'

  softwareName   = 'NordLocker*'

  checksum       = 'C10B666540160A742DF520CE574A0ED605F230031A5DF2A9D2B290C4CF7F6D7C615C04116F9FEB7599AD3F1FA1674195AE05267623AEFB5E9FF0B6FC41AB6444'
  checksumType   = 'sha512'

  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /ALLUSERS /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName)\$($env:chocolateyPackageVersion)\install.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
