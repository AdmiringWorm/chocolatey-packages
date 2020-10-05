$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = 'BF9047B3925BC270408990A5E899A1FED16EA0378B7319A1BDDFB526CC2212FBEC12F4549AAC3340AD4D35DCD9EAD6D1D23D07522940B2E109D7C220B110B97A'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
