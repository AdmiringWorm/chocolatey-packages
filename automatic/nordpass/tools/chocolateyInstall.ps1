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

  checksum       = '45238D5379CB75D5660A016F330F1D4B1C65AA0BBAF3FED2C270C2EF104A63E8281DA1C2B53B0AC1CAE0219B4FCE1A241993995935A39DD49C6CB6D20D7C60CA'
  checksumType   = 'sha512'
  checksum64     = '1B94041814D33DD4091FC903A91D419AE82C418C001BCC5323CA5C98DE935B763BF258277CD90D5933763805C427D9778524E8B28244591AA6045DE75F5D6CD2'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
