$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = 'FB5B57E9A051111B15E5B2FAAEFBAE9B40A17C634CA4BB9239EF6FCB74C91D8AABB064949E9C7D91B0E2B9D8CEEBDE05BD828835AA693232F6739D89E88B3CA3'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
