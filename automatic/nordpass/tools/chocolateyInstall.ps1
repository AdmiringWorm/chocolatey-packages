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

  checksum       = '5F2F8AEE67B4C8063E9E247042BC32381D27CBB42D9F3D061244349A02345EC89A9303D98E88BF6F5C93001B8E3D3AB2E57C9C412CCF64E2801F6194865999D4'
  checksumType   = 'sha512'
  checksum64     = 'B18D1571373368C886E67F4F6DB617D5185B80FF41DDBA3FAC775D7F7CC7D111D42D2D310937353248AAE72137F72AA0E5CED670151FA4AF881F19E356E0A2A8'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
