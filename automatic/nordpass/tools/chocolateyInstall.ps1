$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$installDir = Join-Path $(Get-ToolsLocation) "NordPass"

$packageArgs = @{
  packageName    = $env:chocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = 'https://downloads.npass.app/windows_x86/NordPassSetup_x86.exe'
  url64bit       = 'https://downloads.npass.app/windows/NordPassSetup.exe'

  softwareName   = 'NordPass*'

  checksum       = 'FDDC23D6ECDAF71AE3A5D8889E48B0D61D4CECBDEF13EEB75A5B57BBEA14EDEDA40F9740BEA6235EACF7F422C780345235D941ADA96168D7F041B488A8F73C07'
  checksumType   = 'sha512'
  checksum64     = 'CA5C640A0C5CC074C9D042B08EBDCA1B4319BE234B06ECD56E8A58FCA270AD31AF0CCFF2AA8EB9A97DBB3C943518E040CACD352E0654C40F5616FD646B72C375'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
