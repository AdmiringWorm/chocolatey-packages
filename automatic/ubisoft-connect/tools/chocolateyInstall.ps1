$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = 'AEF4BEFB3759D6BB6D1DF7FB3A81E5290115BFD31207FEB3B22D70BA615339445D8E96F52883DE9E1B077C8326E3C63E1CADAC8AF1F71F947C52E31988DFB260'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
