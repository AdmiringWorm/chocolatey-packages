$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '6FCBB0B621CD93CE5E9B5CF9E980160F47A5B553D20844FC03A3185DF1045B8CB3FC6D3D853EE5E4A5F718BAF39FDD3C5F96E31565D736AA7F4E6426A7A7DFFB'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
