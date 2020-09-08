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

  checksum       = 'B30121E39CA51C1974F3C05C8DF08718D44F079BE554D729D2DEA18ADE44E4B2A634FC166351725ED4B503FA6A47E0234D8D970569895EC461BE682110F57F0F'
  checksumType   = 'sha512'
  checksum64     = 'A76D3F8F3700E700AEAF9231A540D62E8CCB9E4FE3E133B8282F6E6FF21D2ECD870BFCE06E34F21E2451C22C888A439E0BE59623EF1F637D8C6391EC64806DE2'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
