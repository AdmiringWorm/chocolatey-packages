$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = 'CA64D15AFA8BAFABE9878175BEC074B223166F7CB17A3F2F4C7CF1917584A3E39481BC612CC7A84DC53BFCB87BF28FCAE7BF00EBFB66B814CA0EC4E943C8A9E2'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
