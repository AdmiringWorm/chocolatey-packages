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

  checksum       = '261737AA7B5E556FD3B4E24E72A5B4C5507A434DCDE0CC4EAD9FE471103AF5C4064A1071315EEC0FF674204016C4CE8EC808ABBAB997CDE63243995BC09B0CEB'
  checksumType   = 'sha512'
  checksum64     = 'E543D015920FF0A69E3F68C08B27FCA285697B458DA10B47ABC452C58D101877CE6020642D72225A9C2F9DC05AC26291BD9C616BAA05728D537909F7C233C07F'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
