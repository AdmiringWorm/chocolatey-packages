$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = 'C377A87F3438CA31C67E08FBC9272D925D0E0FFC8808E4A0B5B593F75BBC864EA7F0CD8B39B06A11C0EA89135809641FD3EFE84E05E84CF27B5CB530BD4A39B7'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
