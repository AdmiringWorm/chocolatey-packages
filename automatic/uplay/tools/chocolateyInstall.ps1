$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = 'F6EF8925125F9AA6583F65B500C078A86CEB672C831D82AA93C2CEFF4B55BC023F70144C131F58E9C520AF1D63F72AA5328D4919205F7A6741E18F7A1D408C57'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
