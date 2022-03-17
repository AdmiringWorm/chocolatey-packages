$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '0B67A9F2BA2E62E149EDB44AEB47FD8B0538136A776FB93839819B3C9FA0F736239BFDEFE7C6F6E17C4D89CFC5D487442EED4ADEB4A1F758E383F3B6FF2ED7F0'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
