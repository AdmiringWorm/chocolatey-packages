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

  checksum       = '480EE7269706BA0E8BFA20679A36E819449BBB30ADB9F56EED7E8A21F81BAB1809DBB8BD2393AD81246564244D46863FA7152B7CA2E3EC51D4DBA26AC3B3EA8C'
  checksumType   = 'sha512'
  checksum64     = 'ABF06A810AE2B6AC0B3F41E43A365DEFB898522AA2218A52D7E7846D3A09EED9FC44302AB78FCC49B64907260A499001FFA4D63137CBBA7678F54B26A9ADBDED'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
