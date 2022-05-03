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

  checksum       = '4D812A1389655DFFD6C94EC1F3F77D5250F1DECFD6D35B8D0A413C2ACC5FDE287BD276E7EF2F1A7A0AF2B1E117E191BDBB48119AB5BDCD7F10EE6395CBADA667'
  checksumType   = 'sha512'
  checksum64     = '3DB7DBF196CF3E0A59657D074C17866E7479601E1B803BA1520E4485F5F686598F54D55E5F39B1C3D9908544BF8EF392562DBF5A1BB274ECBDCE00F73AE77D14'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
