$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = 'FDA7BA97B55532C9331F98FCD3ABF08F6BA2B0BBC4D43DF0FAFE7B050A488C3C4DC8E28E423286FB530B5A740379E12E4E156EFF95CF64C9D0D72D3DBCB5A8E7'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
