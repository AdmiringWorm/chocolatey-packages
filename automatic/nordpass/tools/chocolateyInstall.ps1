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

  checksum       = '7FB00C852FD93E5C4F3D56B41E131C149DB1CF98CC5CDFC57AAAE515E554B1558D3792B49B2AC12C50F6137AFD9DAE8F3D0B5BD89344D710FB13DF7D49BC4352'
  checksumType   = 'sha512'
  checksum64     = '46533C953F632557BE9CBC69692BFC7E6E876A00B57F063D9DCF38F9AF9E46E633F5BD758ACA1AA92C2DE1BDD68A036071551C89346DF6D38844D6949C246724'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
