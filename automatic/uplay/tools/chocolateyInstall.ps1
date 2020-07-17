$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = 'B5449CFD23AD18AA48E1592FAFFA18F8D547CF2ACA024E04921215F2968E70A38935D0802CB657A66ECC93F2DC95FF42FB398848A90F9E30439F1AEE5DD334EF'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
