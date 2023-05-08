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

  checksum       = '4E73B5117ED216C7010DBD29A610FD708EC217508AEAEBF121D2002E2F0C4E73FCB759DEE7A8567EC8ED239C0D31C8BF5B7ED9E929384B4388150E08E37DC38F'
  checksumType   = 'sha512'
  checksum64     = '8C04235FBB55C1EE2B43BDC53312BF81767D4EAB470FE3B311D5CB215EF4D6ED3259D9567C375FDA4288689B33F70BF5DB17C0B3E424727690B99A800E2B44FC'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
