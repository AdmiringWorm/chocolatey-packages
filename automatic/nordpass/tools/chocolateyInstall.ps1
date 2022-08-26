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

  checksum       = 'F871C181C530A7CC6E5F0FF1472890E07BA7ECCB79D63D49E34C426A4F875E669F9395092E169FAC0DA822BD01CDEAF8EC8BA6DB1747820C13147377D4A206E4'
  checksumType   = 'sha512'
  checksum64     = '346FEF2E95E873B9E52CF336E1F32657437FA838752EC9D8A716843D7F1CE8CA1A947C0F11ACEF17576D32FE6921754671F5ADFE86D36ED766CD779177CADA8C'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
