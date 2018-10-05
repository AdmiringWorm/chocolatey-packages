$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '54C4D1CB0BE459198E2864E81E118A4CD3D9AFAE1B826B9F600D6319F14F1F6BDDCAF9E142341817CCC7749A5AA641867E02022A99ECFF3D60DEEB18AE0EAD0F'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
