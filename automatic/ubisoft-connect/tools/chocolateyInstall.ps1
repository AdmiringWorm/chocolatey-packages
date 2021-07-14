$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = 'DA93A3AE122BB3B452BE4190F1BD84A95D0E3E78EDD655F280BFDDCC397D6D5F17E6DB23A07BB2E2873F7BF165D3A91655D84DE0C83E5325FBDEA87F33F22781'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
