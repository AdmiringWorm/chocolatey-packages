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

  checksum       = '70E7F87FB9570325407A3303D037FE51D0DAEA5BD1DAEC11E1720746ECEFA6EC3EB980E18BB0E061C22FF1901CE236DBD48097B9411506390EC5035FA26DD10A'
  checksumType   = 'sha512'
  checksum64     = '2560E28AB406C2A85260A7C53E5B260FBFA2857E263AEA0FEFFE2BBD169B522F5243ADB2A8A6C3FBE93E33B8AF4F8B9477F4462674AD0475C49E7C38AAEB4899'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
