$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '184848060F4C86D3CFA64B4F0C66289079E9DBE081D44859076AF2E0AE688F39E7046154E8F11D2FE76DD3832106254FCEF2D798E39EB039D5ACCCAAD7A81734'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
