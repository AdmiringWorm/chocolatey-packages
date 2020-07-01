$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = 'ED92D7077A3CC9EFF8AAA4B8C61C23F5C8DC26C52D6702B201E5B2DD2A50CF0330CD334BF93C6DE0657BBC327F04C7EE3E0B17BEF4E447DB0515EB91C7276A23'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
