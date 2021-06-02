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

  checksum       = 'A8E706386A1612A6F00F838783BA1F70974553AC8CEC98CC351B3170F4A16CBDC456045DEF09CBF8EC89FAEC70CBB874015F9AC40262166B8A7C5F678A5674FB'
  checksumType   = 'sha512'
  checksum64     = 'B04ECD6ABA8C8336EFAE0D72D81B12213482782DEFA7B62B4FA9BEBAB0C7B775B3A63409A8A7E47C5DE15D5F2A85F2F7947D2295C1B49A1A2F587CC3976EB751'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
