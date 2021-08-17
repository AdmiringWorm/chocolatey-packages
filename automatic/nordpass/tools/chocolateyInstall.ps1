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

  checksum       = '7EFD07DCF3815E2D6723D6A51329BF204479434404623D8885D2A712918E98FB996C15AB5BB0FCF179083986E13D54CE38DC61B8330F2B059CF9F9E00181CED7'
  checksumType   = 'sha512'
  checksum64     = '6CBB88BE0546F67E04BA8A5325892E379E54E1D04FDFAA244D63C0F7A5FDFEAF9FB250D220B86D26D3CC34FCDAEC7B79764CD2E808E7377ABA86DA73B649FD01'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
