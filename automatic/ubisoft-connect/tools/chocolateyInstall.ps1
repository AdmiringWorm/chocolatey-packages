$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = 'AC3243BE872F95C187A77DC99C60F4B5A1092B78BE5878F495A7F7D053AA699B0CF91D6F2F08B44F4A98E6AE8832ADB5B4C205197AB88F0E9D2D8F47BCB7DC82'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
