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

  checksum       = '674272782B3CB7CC16D667C27B0AC7778CDA5BB5A5DD9F424E8C89A78A5BBBB8AAFC4738B6FEAB363F5B230950F13A2DB80D27890D69E5F066D86CF22B30328F'
  checksumType   = 'sha512'
  checksum64     = 'A65FBF35CCB1760B4ED92FBEB177370FD1A85CE29199D868ACFBE8281278F2C1387D7E13CEF806ACA48ABC8BCBC4E1E647C04BAB8310CDCD17670C4B56FD4EC6'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
