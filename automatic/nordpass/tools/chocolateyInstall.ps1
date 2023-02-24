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

  checksum       = '23AD107D4F158812E00C514290A93741FF5D5D89D04802C1C397ADDFF31129E20953C4E607D6C3017FFE8CF39A9D744441DA084661E7F2DF307A8AD1C7BA940E'
  checksumType   = 'sha512'
  checksum64     = 'C196824D85BD3DA581E4B19C8E4A05C0B2A6EB42642C1A6CF82C2C3C63A6CCFA49A89793B0AE4B4B88E33B17B3FDDD551F7A5454C6FA96A28239BB627BF60AB8'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
