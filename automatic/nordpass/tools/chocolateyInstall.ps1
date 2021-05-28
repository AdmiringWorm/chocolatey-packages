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

  checksum       = '6F4579041E5B754234F9555DFCE222CF7561B9A7DB73ABB95649EAF45A4F0607E2984BB297F22C35B5A94C01A308B406A70213D1C08713C8115EDFB0FFE38A05'
  checksumType   = 'sha512'
  checksum64     = '864150E691AB483F097D4D5B3B5E86705C376FF8332B844A965997031CEEE10836988C462689971FB1BDF10AAB644D1412EC224B7A5DB42C055853C0197394E4'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
