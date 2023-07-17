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

  checksum       = 'DD4669CC3111FEF81C5D8DE38355D3CCC24826F9E82602022ACF1517ABCB5B2D3A4F10CF7F849C7095C4E841DDA929F2DEAF86E016022D3ACF18B784B46E3660'
  checksumType   = 'sha512'
  checksum64     = '32EBB63448AD24C9E803209BD761C58D2FD38E97E6165DF72F56C0EBD129D001AB86BB9FB586434FA65B4B4F37F936040E6365CF6CB8F5E56103F4623181AFEB'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
