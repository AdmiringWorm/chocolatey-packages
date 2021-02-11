$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:chocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = 'https://downloads.nordcdn.com/apps/windows/NordLocker/NordLockerSetup.exe'

  softwareName   = 'NordLocker*'

  checksum       = '5058B6B0F68793DD20A11B30CC706D15A83438F81C2566B12C35693CED8F198CC2FA72D73A4123C76213B03EBE02DA4F15D8D09E56176C0ACB536A29114422F5'
  checksumType   = 'sha512'

  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /ALLUSERS /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName)\$($env:chocolateyPackageVersion)\install.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
