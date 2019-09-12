$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = 'A4594581CA5AD63AC077DF981402879F0AEDEAE4CADB85D027DAD037E53380FF2B43CEDDB468D6C4BE55C58E80C55A2AB6BDC30B459690C36A533656620CE553'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
