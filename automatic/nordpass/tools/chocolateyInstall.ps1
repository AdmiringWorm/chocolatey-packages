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

  checksum       = '82A24F8D1A0C2A571092C62BCB53083F088D640C37881C7D5779681C1154EDEF80F251505D9949260B90723AE270AABB02982608E75D2AB6A07356D919E5CAE6'
  checksumType   = 'sha512'
  checksum64     = '54413DD765A95A3C14DF62FDF458E9DA8716F03205DB744451BFE5FDE4D0D66010F00BB02DA641ACB1E943943D34B4A1AB83BE2C4F02AB4ECA03856F7749973C'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
