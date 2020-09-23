$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '4885F8243EDA35038BAB08F0D912539A2E85270C170E1D4A4DF4D955E9CEFCC43216BE5EE258459FAD68A8C5F877E777734568E980EE6EEEDA410502A45345B8'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
