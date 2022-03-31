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

  checksum       = '719F8FD85C8E0A6CC6586A2AD355E43FDB89BB8E3388994098EBB2D7B5EDF42222F423ED68D5450E7295C1196782362FE786060A3084BC1B3CEF6CFDB4B7C567'
  checksumType   = 'sha512'
  checksum64     = 'EB43FF8B24396DE50C154BD9F74F7F2980260B9EC7594DDB7409FFE169AC2F4D69F1BAC71D5D6B72502B520AE214D5EFB04C42271B8010944BCB98EC2E111453'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
