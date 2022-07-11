$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = 'D0549E2CEB865E8B5B3CCE2F8642B8F47FC4A274263DCF7B484F8B5C4D6C5B8A5B508EA8DC01278CC2806CBB1C322F8B4E4A30FF6946EBAF6F56D86358D85EB2'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
