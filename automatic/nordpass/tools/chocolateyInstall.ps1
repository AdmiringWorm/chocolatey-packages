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

  checksum       = '0E8C2277B7FFBB7DA195BFFBCDCC67FB9C2DD9167A8B00BCE96C5938291FAECF53276EE685E83F56AAB2FD15BAD857B4B03EEB2985EE4C433FB04506B2CBE433'
  checksumType   = 'sha512'
  checksum64     = '4D48C19832C4970F9D33AC824DAB94AEB6274931FA31CED3E7E96B02692F7BAF5CF5DD8226E3D0B4F54D704D4AA03AEDE2B7E9CE5F1334F59CE09EBDE4D40ABF'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
