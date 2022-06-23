$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '95A2A67682AFCC71DB6F2D6C6CAA356B770FFB9C59C963F1EBC13A05C87ABC7809374674673828BF4A2FBCCA459EC6E4D6EC571068D44CF37628E8C3600D6146'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
