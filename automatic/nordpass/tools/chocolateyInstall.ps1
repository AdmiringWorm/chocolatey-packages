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

  checksum       = '3E3D88A88DDA1E99027262907C61A6CBEE02121CD57CF2EF15B295E52CBADAC1612A4381AB71B7293F684A056380B5BED16892E3C9FAB6A11751D88DD400F419'
  checksumType   = 'sha512'
  checksum64     = 'C823CB221F125C0BB7F0AABE3A15676CA7AE87AB9D5B4AE97BF0DE7E4EF62AFFB7DCE47C8D4584D9603BEAC288036FF2D41B0E4B63A2F0B1B15C7C94180F1C77'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
