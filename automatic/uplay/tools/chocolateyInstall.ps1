$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '145D0CEC4D48FB90FB33FD414BEA8C8E6D7639C1233E38A6B005C9EE22B8094BB0890C580C0CBE2718D56307CCE5D3A0CB3A0F22E960C5FCBA066230044BF280'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
