$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = 'B1FD5F7EA69491B68DD89EB8131B0731A35E62D0CEC1471799D99DAEA443EA4BDD12100DAAD775C0E9E65CA2C87E14B008E66FCE8F40020D65E26D151736E4FF'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
