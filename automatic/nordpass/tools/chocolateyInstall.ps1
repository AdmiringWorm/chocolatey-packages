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

  checksum       = '7861652C3C9065358434865FBBCF11186BEE08FE00B56A04A08DF823D60593853657A04B4EE2B777FDE4CA32585F582DE1619D106B47992BE3D7FB30C08860F2'
  checksumType   = 'sha512'
  checksum64     = '633824D6F8CAAAF73A0136CA66A622D008B10BA51AE91E4557316739CBE1EBCAC23FF1337315B1D558190D328D4A5C9DE4C3D64B95A4786D8F8708A31DCBB8D7'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
