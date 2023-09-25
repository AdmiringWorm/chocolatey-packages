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

  checksum       = 'ACD2B74575EA61C6184ABDB77C5D43FD79C9A8D1D17D058D0445A18423F57C4DA8DAFC454E5E6B3AC1DD452F083457A8B03AFC9FD78E5C1F86F14C51436AE679'
  checksumType   = 'sha512'
  checksum64     = '027CBE6312F07CF5B9EDB1B5B5FC9D748468A1F701245F7249BE476892CA44F1E8816BF9DBCDD1F8495739570002B866BFCC2E8BFFF765FAA424064167A744C1'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
