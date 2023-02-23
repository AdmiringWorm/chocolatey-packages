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

  checksum       = 'F794B4F9C03CEAF9A3F8BC554F05F42169C6021D831EB8A581301F15E377727BBE7B92A64890576B38BDC61EB5911CA2D93A06DE8A780C4F201E85CD6CF10603'
  checksumType   = 'sha512'
  checksum64     = '2B83E8912C976161E89B5EC232CEF55A9BCC720A0C3ECFC4996A2F31B6D5EE699BFBB643980D78C0C93DB612BCF11E4EA775E15CCE2C0F4EE78BF96AFFEB32AD'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
