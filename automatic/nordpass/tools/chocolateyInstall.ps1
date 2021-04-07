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

  checksum       = '5E80613310D2323EE46E96FA1B84C55862ABD575ECEABF999E749B3BAB0BAE13E237F25C0810EC1E8D16B675BF37EE8770713D59C19E6E56D16682D6044D2DB1'
  checksumType   = 'sha512'
  checksum64     = '73134EB97D5C19D23D1FF85ECD270B89A3769DF7C9C054D719A4B19FBB260BF7A84C5905BF16CED82736B5A8E1C92A175E7FE34020909723CA1E603C78B31BB4'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
