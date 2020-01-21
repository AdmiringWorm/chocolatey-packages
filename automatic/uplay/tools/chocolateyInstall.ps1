$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '14500691A28495639C6C2123795E6E8C00C8D0181D536E927EB0E1CB7B87A14A815341ED88F9E235E6B9EDFD67CFA0A2F9C109B43F5BE7C4F0B1DFFF1F921BE1'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
