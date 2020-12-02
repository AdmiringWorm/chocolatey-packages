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

  checksum       = '9296B81848E609C19BCF50AE4D839F76C54E8FDDFA8F85FA0D33956A3939156CDA49DEEEB6CFC638AA18C98BB95CD9F0F541C848F3669A9F28DB28C0C383328F'
  checksumType   = 'sha512'
  checksum64     = '36D2E81331C784551884E50884D3420AFC860BEB26188F9F29F55F5B88FCFF6CCA25F72F1DE1260DF82059776C8CAC6406726867846474099A0B8834DA009D82'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
