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

  checksum       = '0B096B4A6BACF074B63C8B1CE8D1502C7DEB6EE120D94998189775ED93BDA6DE4567C276E9A8EAD1CB04AE4F8AE44A8263BE68C5FE30C00D81769992AAA09112'
  checksumType   = 'sha512'
  checksum64     = '8A24C621C7574982586731B2F91DAA36AA759B42F1140A13E72ABB9E5A1D2BBB24F2BB8C1A8353EE525DAAE13BBBB140F654765C9C3A3719AB1884F719CE1EC6'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
