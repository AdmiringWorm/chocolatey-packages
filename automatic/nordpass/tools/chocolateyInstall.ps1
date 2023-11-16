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

  checksum       = '2C05FA68AA7B926FB4CBB7D3F33C1EB691BC9C35128F4EC35133FA54DB0D6004B7EB7450AF97974C6AE1B1C1C515F24C218C090F6E0F9BAEEC6BCC5B180EB79F'
  checksumType   = 'sha512'
  checksum64     = 'E3EF93E194E290694443A3C13AA1C66B2A5FA369DC564FFB6C82E53EB526E556C02F8BDF2FACAE463DFB20D536BF759976CB23AF9FF4EC50003EC82888972E03'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
