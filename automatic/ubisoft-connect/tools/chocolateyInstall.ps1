$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '5EF5BF6A413A80328C2C37E22FB087D959B4A1796A7C1A7F22C63EB6ED7006A3D1026D7A0ABEE70E72ED60244336CADCB2AFF37E93DFE28C67A9582322674D36'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
