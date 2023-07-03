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

  checksum       = 'BEAA10D746F67DE654B87E32DD2E59523B5F1A181857871D5D2B2F446F1BD596C5864E088CDB1BEA20A20A23F1833CF34E6379FFB6DF6F5F967526C16BFF7ED2'
  checksumType   = 'sha512'
  checksum64     = '0151F9738E3C4F66BEBB0FA3E7C70629DACCB00F08EFCE32AC934B4CD397156161434854692EA4664D49CEAC8015AF75C4FBAF6BBC6D99EC100C48531818605E'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
