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

  checksum       = '44A2F4BD52623A3615DE260CE30351489649D9384A7FF15C0EA36B31AC60830AA7A7555535CBBCDA870EAB0862DBCF69DF007551232B9CEC6D31E0CE417301CA'
  checksumType   = 'sha512'
  checksum64     = 'AD2646AAB99460E02D3DD40CB4820C760416C000E71B1D6C1545F34842E31F93A1EB7D1ECEBA9A4F171680C136CCE0578D76180B02CE3E6CF7F536AF1B55C53B'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
