$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '99858CC25341FD942C731171E1C6E5E3DC4F44F28DC14BD1AB1181505FE6525DB1C1A0298F3353A29B3DB79B4343DB1F18630875D4C6C64F147D2949B70850BD'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
