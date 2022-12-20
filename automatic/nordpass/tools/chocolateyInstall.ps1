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

  checksum       = '79583B1040784A1F2482E7F71345CCA72051D5740BCDE5063DD19319703C15D076459F1134A92B1301C8ED85139035A88BE6B172A717CC23324DDAF231D6A407'
  checksumType   = 'sha512'
  checksum64     = 'C3B374B2134B2014FCA66F472B5D0938A6774F414B53F114B8C66C17178F11DE8ADD78053497DA63741C6C75AC19EE9F049920C126483D5DD93BDE850A7103B8'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
