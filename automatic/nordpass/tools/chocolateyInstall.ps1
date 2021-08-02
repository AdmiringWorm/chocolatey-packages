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

  checksum       = '021CE82DB43DC022006BB027D1F3E05023A924CA987A7A8B63CDB2528B918C6AC485D13087E95274D0F6FABEB8EEA699EE4F39BDE5AF664F6B991EC871FF6A20'
  checksumType   = 'sha512'
  checksum64     = 'ABBF7CC18CF581755659CB3A35F00E213C986EC92032FDD318F66D44886E0336E9D91BE6EB5FE273FAC72D02C4158BC694E97506F1C144022494E9BA3931EC5E'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
