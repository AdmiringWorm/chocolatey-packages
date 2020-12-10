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

  checksum       = '4A198CD015B35D6D6D558A8B35279C49BC9142EA711ABBABC61419BEA6852EC5A13FB1D13D3427D645B97D1317448A769C29B0862DB10EF74C5B0A1EF0C4A7DB'
  checksumType   = 'sha512'
  checksum64     = '3AD7F5B766805F4CD6B9D02AD67E0C6B647EE4A558FF48A51DCA5AE4524B100438B6233E37343395CBCCFF64E249BD4B504376AD778A6D519E3382D451B65D8D'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
