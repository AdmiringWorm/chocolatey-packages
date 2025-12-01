$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:chocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = 'https://downloads.nordcdn.com/apps/windows/NordLockerEvolution/NordLockerSetup_x64.exe'

  softwareName   = 'NordLocker*'

  checksum       = '2360CA072D38A3C31CA25DA1D7AE66F7C2FE784F1E919286103A2B835327CBAF93205404D526D859C94CF3CB4CFB096F5CD450EA981FA3B186D73163E8B7F4B9'
  checksumType   = 'sha512'

  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /ALLUSERS /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName)\$($env:chocolateyPackageVersion)\install.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
