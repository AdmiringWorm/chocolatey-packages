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

  checksum       = '6DAF912362D3C87047AD1A857E0B8535DABDA3047BE4CCADA244C68ACE70BF9075AE840E20241DC2978815777894A5DB941EF10D5AF70A18D3591B5862A665F4'
  checksumType   = 'sha512'
  checksum64     = '1F3ED75FA9898517DBBBA769D415D67C0003A8E6D6C33182249A6027F369A9F8760A147C034B64C34376E2152A215CC39D9421866180A91B11D6CBBCBF85891F'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
