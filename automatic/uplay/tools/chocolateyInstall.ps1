$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = 'FB4302CE3FFC810BFFA9234C13E0A3D9FD71C7E519EA30F645B42FB248E510BE7E4D9E896366B88310170E027A811F30A819008B74F884F058E2AC421C037677'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
