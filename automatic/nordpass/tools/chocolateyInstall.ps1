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

  checksum       = '281C9E2941A555F56D87400D5EB2C82305218E8AAC281000996853CDDFAE52AB19D108B05B9D3201BDBB5ABBA7500160CF1775C131DCC5203ECCA6ADC3218860'
  checksumType   = 'sha512'
  checksum64     = 'E6F02A2E36685BED3EACD5CB72A227D234E716F679DCDE63C973DC5979B6892891F7814AE789E980AD8388975BE5E70781DF9FFA857A8DD56B11B952C2D2DAD8'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
