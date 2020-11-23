$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '6AF5C5FF22471C835E04DDECE40BF0E1593FD32E9286918FDC8F9CC8620529E8268BA296416FBA86F3A0F42E12BBE77416317EFDFF9697270FE2658F51C0E799'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
