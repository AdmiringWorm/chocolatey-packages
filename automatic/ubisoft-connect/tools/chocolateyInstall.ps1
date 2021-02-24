$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '35A12967D4E3EA598821634B30077A5FC6BD8DEAC5C4D03C31AA320EF55452270B5F147AD91BA902A444BAFC67E6583D0FE6B6A78A2E66AD0038296C5B71D11D'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
