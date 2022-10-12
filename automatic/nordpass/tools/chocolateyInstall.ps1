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

  checksum       = '49410A1DC39C1A5B02E6CE8A5661E3F3516A7BBE4D19433C71946F8C9F544FF191724DFC213614937A29507955DCC33C9A1033218CDAA9157B17E13C184E0A1F'
  checksumType   = 'sha512'
  checksum64     = 'FCBE888B652B4512169474611684918E77086C51FE0D836239C4C174C6ACA856012F9C3692ADE0B62930659E0705BD6F4F0986735AF1A29DEBE48818B76A4FD9'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
