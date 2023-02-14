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

  checksum       = '99904AFFE23B9D2A16CA72155E812A8E825A33FCE5F70B73D60B059A86A15DA7B348F74411ECAD3F12C10C96D59818628B8469F1887E7EB629DEFE53AC6E0B29'
  checksumType   = 'sha512'
  checksum64     = '5C8477E821D1D492F1F44E74A292E5EDF5C1D24BE392B2CE485C307EE3880218F4CF8EB35801261AA34FED9E9ABE53787747E74B86BA64B080C38AE5580E68CA'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
