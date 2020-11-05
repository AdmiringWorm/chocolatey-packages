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

  checksum       = '495B2AF7EE60996462720C944719DD75692ABA4C8ACFF5855486B93F2A937F942BFE5A30E76AC0FD4AB7CAC2F07C1D6E1B6E35E04A125DA78668EEEFA1DC9E91'
  checksumType   = 'sha512'
  checksum64     = '0FAD5F07D7854D31A5BCE0BB10CEAD2E4334D7979EDE4FF7947D7D0B7CAEDB7E631DA98282AA88F8CAFBD65D5A8EE998C6F467C61C589BFE928D6A49681DEDD3'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
