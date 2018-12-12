$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '5DE1D08AB1AC332F342B589551888ACDE7A0C58F4053ED4B0C0AADD4918E9FDFEB24C2AAAD71E2B674CD7EF5761E990B99BBA55F6E8C554BC401D9DF0F85815B'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
