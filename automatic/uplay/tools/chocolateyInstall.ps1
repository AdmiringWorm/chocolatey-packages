$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = 'CAD4421924597C6FE1D28940C514C65B3EFF3E9D12CB3E611E835D0568F6A4EB5E7F30AF61695EE5A850690A6CF07337A3A33C1FE18507DC0EB2459CDD0DA8DA'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
