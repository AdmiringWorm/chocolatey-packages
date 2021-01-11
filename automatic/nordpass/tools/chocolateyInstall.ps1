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

  checksum       = '22C520ECAC6247F4F2925295A74F935A2785CAB92AF5B8D11B3C428BFF0F13F3B85B068089389767ED712E12C055247E2845E9095A9B7386C1DA38434D2D9E5C'
  checksumType   = 'sha512'
  checksum64     = '75474BBFAEC0E37EDA0BA71AA358E3655D745D894B06192D17CD40D172C1F090CDBBA403FFC832661C2B0D65D6BFDCB766145B0F36615130F4A681950872385F'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
