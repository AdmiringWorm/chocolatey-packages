$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = 'AE934B1C054CB5CF2EED2A9EEF9C206B93B151683878DCBE8FFB3B358809C16E1094DE02FAF85A24033E8E5386E7E6E9E87F2DDF381A59B4DC578A84989F1F30'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
