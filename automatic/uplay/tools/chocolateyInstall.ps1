$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '43B215ED481D79D1FA544C6008E1360D084FD9AC785EF96C763D3EE7DA93C4C00B2015BDF2948FCF0CE34B7E83E419B2B6F4D573811215B869C42AD2DC643634'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
