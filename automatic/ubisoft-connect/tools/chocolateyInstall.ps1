$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '42FF0C9792C1A4EB1C4B956420DA837DCDF3999E01A96FE1FE1DE2E8F9E23AFE198188C7A650A85805DAC0795CFB52CC02F37FA9C3001E0E2F7C4C3C37D7D1EF'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
