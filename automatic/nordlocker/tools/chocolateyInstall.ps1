$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:chocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = 'https://downloads.nordcdn.com/apps/windows/NordLocker/NordLockerSetup.exe'

  softwareName   = 'NordLocker*'

  checksum       = '3FF26BC8B58FD7ACA8D56F6EB3F4D752FD77A9CBF27FC904450ACDA8B29665C7A86273A747D7F791A14D3FE97160B5D20AA88F5DB2C919BA9D934E650C323BDC'
  checksumType   = 'sha512'

  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /ALLUSERS /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName)\$($env:chocolateyPackageVersion)\install.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
