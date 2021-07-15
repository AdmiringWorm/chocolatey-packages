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

  checksum       = '1BDA26F77B966579B74FDD3350718BCE723E15C1FD5032DB7C16D8B40828855396891CE582AA3905000146AE45CE84F37FF0BDA86653F95613CC41A72FF50BD6'
  checksumType   = 'sha512'
  checksum64     = '6E3CF9F79E0B0BE2AC09EAA90CB2DE353672319DD06A68F5A4E07DD6FAC0577D42FE014640B797DE4F07C7DA04D2B4AF97768D458295DF4C6573F9CEE165CFB4'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
