$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = 'E342C7C35B7295D7564CF16D85D33E4B1CB5DBD30B50BE3F8205BB46EBEA19915A6EB77CA13DA8B550891163BE3CD32E3D18265B174E725963690751DED646AC'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
