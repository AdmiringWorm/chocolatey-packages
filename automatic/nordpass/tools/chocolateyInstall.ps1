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

  checksum       = '5A406F47BDE626983CDE958874FC15EBF7CB54AF724F6AC379E3BCA23364BA5A79218B83DC005D127A12DA705EA0A026233CADEC74EEE4E99D08D43044B7CFCF'
  checksumType   = 'sha512'
  checksum64     = '2668A8ED7C12715527D4DBA9EA4832B5752A43580323F4FB272C7DBE1B63E3BD76DD94D84174F0BF62D85B1D893251BBF6D62D4FCADCD43E37DB4952960FD234'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
