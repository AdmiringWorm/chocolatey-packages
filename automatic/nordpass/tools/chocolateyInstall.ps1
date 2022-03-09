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

  checksum       = 'BCD5883724DFD4A8714CED6EB25C5F8D4B33C1238D8FC7C1ADE43C16B07153A2133773C57D3C2C913460ADBCD757B5B1576DFE2DA2453021B4CDF606525F3A50'
  checksumType   = 'sha512'
  checksum64     = 'E19DA8FAF4DB6B6B6A91BAEED20B98F9A039422EE0101D0F7769DF340A4992739EB71FBC0537AA9C5AC599239CCCA7E56FAD6B01472C25C0366EB94880958380'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
