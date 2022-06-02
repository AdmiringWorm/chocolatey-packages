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

  checksum       = '636D6D432DE0C25CFCC503D4D83B4627CA0C3C9FE00B67FDC17EF767C89BBD964FC2E42EF399B4E6298B5E4D3AD19CFE145B56DB5286AFF39C7A104114534A60'
  checksumType   = 'sha512'
  checksum64     = '2DBB3E68D972222323D3C3761856DF1188F4C2727F526C31AF9E08D4087C680057D7503C86D46D70B6C5FD46F2DABE207C751E90CD13EBA22102A88A04FADD64'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
