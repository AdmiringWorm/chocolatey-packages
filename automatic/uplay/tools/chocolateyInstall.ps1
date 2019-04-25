$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '12549B174A03A8D48D85DC6EA1D6B389A83979BEB33C17E2D2694E6951FE8E247DA99DDECA91944C813B34A098301F15E7D31C77F0D0F2003F4983B598DC77D5'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
