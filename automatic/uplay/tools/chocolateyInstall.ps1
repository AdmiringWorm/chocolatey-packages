$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = 'EEBBFB3EA2C1AFDDB2575DD98B616AB4D8CD7728A97EB87D68748570E593F10FD9BFB559CF33D41E6B665368256AD0C1E64712A2964815B3AA770E4036554F92'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
