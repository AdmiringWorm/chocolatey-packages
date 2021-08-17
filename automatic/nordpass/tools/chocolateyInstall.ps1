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

  checksum       = '687694C8650E870C998C97C31C610772856A0AE2AF9C35BE6DEC8AFAB6F45F678266C3794F9D6F2E018950DDACBF19807484A54AA79211116E80914FF1DA4BE3'
  checksumType   = 'sha512'
  checksum64     = '7150A203F57C888B46C2CDD39948FE6E9D6960C4FCB7589A6EFB934865659F71FFEA792F9DC9CF97618A01C1C655C6BEA1951446E2F6D4AD7299F8DCD802D900'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
