$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:chocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = 'https://downloads.nordcdn.com/apps/windows/NordLockerEvolution/NordLockerSetup_x64.exe'

  softwareName   = 'NordLocker*'

  checksum       = 'D6A95023B0250966B4DDD4B2FEA1C1DEF632CF9967C52D6A27E88E000389F37206992D4C90ECF986AF4C5B3D3F8F596805275DD836B4FFA9BCAC1D512842CC15'
  checksumType   = 'sha512'

  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /ALLUSERS /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName)\$($env:chocolateyPackageVersion)\install.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
