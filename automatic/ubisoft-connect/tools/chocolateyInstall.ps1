$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '7E8F584EA969988E5ED530FBB911AD6EC4A0AA4D0F69488B066F3B647B39973577394B4DEE5F3712CF6D52B7C6EDABD91EBD15258418313474BBAD48D7F8B7AE'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
