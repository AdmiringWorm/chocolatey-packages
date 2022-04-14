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

  checksum       = '84E189EBD47B23E0D7DEDBAA838D863EC84E81B118DECC4396F53F15280AC469331F44115E96630FFD38FAE03D0E6CEBC9A606DD813E6E22ACB00BAD7B970B4B'
  checksumType   = 'sha512'
  checksum64     = 'D89B0F5121B4A66BF4E9CC53B3F66BA2ECD11126574DF3266818AC4C776041F8F768C78CA4BC308D7EC16565501FE209F67734D40C656B45FE19B4A3352F70E9'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
