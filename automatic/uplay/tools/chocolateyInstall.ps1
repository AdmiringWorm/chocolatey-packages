$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = 'F3FE37A6F1EC37E8B8857B637D502B4F4793035F09876B047765630D1479873912BF9EBDEE60D51B480FC572DCBD4E2DD6A3C18ED81BE5989E0FB2FE78D1A1FA'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
