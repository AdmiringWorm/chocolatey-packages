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

  checksum       = '0A138BEDF55BF0666F32D00E7F2984D364800A4E2B950B20FB68BAC81A78F06992DD1D918734D48CD039CDD66649A3C75332B597E44946BD0B8F80448D4FD958'
  checksumType   = 'sha512'
  checksum64     = 'CA7137EDFECA42F0027C0A1AC0212E9AE0D5358CA317FAFAB18139E05994CC448E14D7E53FAA3733686BD96C2BDB217BA0251F0E87137CE3C4DDFD6D9DB500A9'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
