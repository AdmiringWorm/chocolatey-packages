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

  checksum       = '3427D547CDAE1FCD870A84270D6DC03B66705853D0B96544A1B4FBF007087717BA3E04E20B70ED29B2D348CA29D5CC9F93FE97B2AF865ACC3153BBFE9A417659'
  checksumType   = 'sha512'
  checksum64     = 'C0035DE4130AF474DBBB4F7FF887E471DDB5F1BCD50CEE87B9C3C909133D37FEEBC4580292D20EEEE5282283EA4B8A6B184053917A78F0D58A2539F4B8EF0813'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
