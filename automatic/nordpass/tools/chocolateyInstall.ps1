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

  checksum       = 'DAE1F55881B2FDC79A5B1C0D595CE8E7923933165B1E6534A8AD682877CDE7D56E70C88F17723CED3B605F70C83B76CB13F591014AFD3E2320F38E47B0A1BF65'
  checksumType   = 'sha512'
  checksum64     = 'B1FD3416841A794A6997BBB482230EC361F9C24026067BE930C91B85A1AC15BE6400CD2021B688E19A85532E86FF429CDB316317B7564CA30DFB1E7181DF9FE8'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
