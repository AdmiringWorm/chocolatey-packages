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

  checksum       = 'ACE48627E2A65467374FB7B68122B5F5EEF95852ABCA20E592687F226CDF9651898038CCEC9444625A378AD849D069CE465F908B68BF74D973816CFAC2C7F073'
  checksumType   = 'sha512'
  checksum64     = 'DAE6B25B9E37C90BD31FED0A41E30AF2B81B7DBD078A7377EEA20824CB12525E286D3EC41778BD183C7A1C24CE0514286A89CE4922778234881B53BA4CFECA6F'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
