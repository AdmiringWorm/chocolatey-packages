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

  checksum       = 'C4AAAC51C398DAD43A226A7369A8760CD5231A6CC3EEF054FA5113F60B847B96A3F7171194035A382B6B0B4B861F7C893539FD7E250588032B9EF7B7E892C1E7'
  checksumType   = 'sha512'
  checksum64     = '18C468CBD06A9DCC04A59956C8083D35310264E6363C0A1238FA557E5344D3A00F099B66EDDA7CDC73E617956A9680CAEE6BB75C6609EC6795B0AA48C38AFB99'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
