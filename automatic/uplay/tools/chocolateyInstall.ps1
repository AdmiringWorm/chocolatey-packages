$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '518359EED56287D03D7FC5BDFF221C06136F7FBBCA7EEB9B940735FEDCBCF14F07E5299F25A4C679F7ED809CCD31E3F84D717D0B5CC735FDBE7F2E45C6DC49DF'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
