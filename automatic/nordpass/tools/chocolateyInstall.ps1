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

  checksum       = '0710C2E42293975B98DA8FE741E57D11943002D998B3565E1903B07D1FD011B08F9D2C7E0BC482FD5144531FF22B90B51A0E7CBCD10C97F8AC3FFD9EE41A5A51'
  checksumType   = 'sha512'
  checksum64     = 'EF6B7AA67DFBD7FCBF0FF4667C2E8C20A1DE97D536418527D4DE846D776928D9FBDF15252924299505E7697AFE8E7A6EA9A9E28958709D9912CDD21A5F431032'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
