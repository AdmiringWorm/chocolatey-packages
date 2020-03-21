$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = 'A41806A83976FD3CC2FFA8D8565DE0FA84B1EB463173E2B3498916FCB681AB8CD1F5F269727124F31E9230BA0CE7B67667F1C56B18534CB4C679515C889097DE'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
