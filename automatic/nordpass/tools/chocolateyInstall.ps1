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

  checksum       = '52EEB9CB9B2E7B9C23B6CDA164266F32E2D785D0E4C7BC49F6F6FDCCE4CBD944753D6778E6BD12CC141942E304D9BF96F199B97450E99F949BC74B4FB42C64E1'
  checksumType   = 'sha512'
  checksum64     = 'F50B41CBEE93C5947BEF6764D89FE174ACD0DFC0C5544E01E392E11D2A9062E7DB1A2A7415B270E5E73AFB5DDC3638F4A44A800902C0AB7C87C196C6C698F6C3'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
