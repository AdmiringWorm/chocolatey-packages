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

  checksum       = 'A7D38E88EB4CB0D28DC69E91A9E6E596FB5D54F5BF055BDD975A87BAC7C29D9FB447D2E3D9C06E349FD62999871BA53ACC4551C2EFB18019C756E4E1124824C4'
  checksumType   = 'sha512'
  checksum64     = '334F4591E4E5DFE56E387959FCCEF2B3B5CE1C78BED95A38DA87CC5561C744AE6C8407526249C0AC22EB44F50CB85D4B5AFF9F752C6D81B0C7927D9CBCBAF7A6'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
