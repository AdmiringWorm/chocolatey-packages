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

  checksum       = '826E753A8865A9D65C82EE9E7E7B26F582DA2750971034D58EB04D0BF6CF3F00C464F13896C18D2DD3E0F78FF0A5C17FCBD0488642275F5C739F3675F892F7E8'
  checksumType   = 'sha512'
  checksum64     = '000DF1E63071CBE608537F257DAA532A8A75DDF8F9CB6B03D7F476A3D52841BDE0E0B0327CEE8196E3767706F36E4E9763D8B350E17F13210430E7BC907462C9'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
