$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = 'B02E9AEB5ECFEFF58E25E214D871AFC36CA09771F6D7688791DEBFEB1CD3E1C507633381F4FEB25E9A5A7A8F8C0BF5682AAC7988EF670F22427371784F1DE115'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
