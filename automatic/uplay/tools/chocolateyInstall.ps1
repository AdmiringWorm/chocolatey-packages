$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '146814E251EF6C0F00A61A3B4B016AC9BBF11D0ACA35C0BD5EEF497B66B3152977FC3B1B41AD058991DBFA2DB593350F51B65C3B7272A5D73239EDB348F7B26D'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
