$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '3728C63B04E4ED262E20F40FC53B91C8B4BDA51E7FB814D1924F7B132DAB57FCDA51BF1EB76AD09FD7EE587F4E7D0533F446025483CA0B8226A80EB35F06DC56'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
