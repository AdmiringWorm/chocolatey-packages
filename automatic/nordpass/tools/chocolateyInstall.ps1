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

  checksum       = '2FE781A4E93BB682E7B02F7DB834D304ECC94ACC225112B843392E99D812B7D077C8DF9C1B6DDD79621DE996D70A20EA423499E66FCC4F6A8DDF684E57CB3F5D'
  checksumType   = 'sha512'
  checksum64     = '281E178E1762A098783DED85432E3CE078316B09DECC7F750B169A7C27CAB38982668B1D455E8C7505D69904FD78BCC6C89AF85677E005FC7D46A659931DD3F5'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
