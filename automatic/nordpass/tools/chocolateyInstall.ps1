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

  checksum       = 'EFCFDE14E8A3AB49943286A026D540AF5D95DA421D4DE54577610B093BB5ECF20AD335F4A7665C8EFFF57DBEA321BAB3325A6FF086F723D237AE5AE2FD7ABBC9'
  checksumType   = 'sha512'
  checksum64     = 'A83776839ED266257CAA3D21A9F5941C6899E76C3BBE41F4F74CE2BB77789C69655C9FD8DC76F3F684581A95F5EDE4D7ACB2FA31F7A59B8FA2BCD0051B376EE2'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
