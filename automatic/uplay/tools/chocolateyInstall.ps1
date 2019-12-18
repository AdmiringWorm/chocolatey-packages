$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '094C9F432D138C023FF1BC286C7FDE374F47A5A402422CA0C7F37E482C6832F5986809A2AD358B4F645BE9C68D4A5473C405B30E463C27AAE1E9BC8B4A4C0017'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
