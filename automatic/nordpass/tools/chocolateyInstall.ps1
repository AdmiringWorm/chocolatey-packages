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

  checksum       = '2DEBE2BF238FACF9D04D3C833418223982E3BC763E4C8E7E19EA593B6900B0F456B408575C3D49CE3C3088B1C6C3E7FF25FB5598B0E9A10A19C54E15CA16C3FD'
  checksumType   = 'sha512'
  checksum64     = '0461229A226BAA7335AF4196CED4C3FB548CB79369C0D4857EBAD9F34B28E868CD6F4D5ACE823D5A7B1DE360195066C7D0D1980E6A61802BA10212514D9A18F4'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
