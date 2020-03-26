$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = 'AAE4D181DA89051B284E639B889F3705C8C99E8BA0328CBCD753743863183B6243EB685EC84FAC4841C59E0B6B2A346ABC3A39AC7843F3C135E71A7E82A34C15'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
