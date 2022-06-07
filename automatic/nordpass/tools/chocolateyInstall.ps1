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

  checksum       = 'C31342F34C18B21B31DAAAC5BB7160A459DD2AECAEFB21E9499CA5761F9075E55782B8FCF3AD0344EE661BA3FFBF04566BAED90103A5E3F0073E160D1835D367'
  checksumType   = 'sha512'
  checksum64     = 'AC2050B4281804DE73C4E780D7DCE09E3282231C04E90956E40DF0CE75866CB074589765E294DB821179BF799B3562B57085DBA79FC018DBAC211FA8C3EE1CCB'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
