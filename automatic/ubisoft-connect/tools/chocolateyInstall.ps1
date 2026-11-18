$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '69AFA03147A8426300DF21355DAF574812E9993C56C80BDE5B03AC9667817E350EAF130530717A9050F38ADE1F373A2E88CFA7D144A0D18110EF482A20D380BE'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
