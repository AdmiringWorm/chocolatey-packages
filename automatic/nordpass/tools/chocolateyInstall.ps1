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

  checksum       = '61488A2A2DCD103622A08761C1184E37E9E764D15FC302AE6F33C84345DCE0868CB8171D58D15077600E408B7336D0CE285E7ECE96B41F648831D95D05904D5E'
  checksumType   = 'sha512'
  checksum64     = '27C1829E0607FEB341F5E08EDE396312EB473B9D15CAA524003C63CF754F85F7CBCD04DA9CC0DEEAFD44B75151A5FC066DB2EBDF763C2426C2F0C09DBA0BCEB0'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
