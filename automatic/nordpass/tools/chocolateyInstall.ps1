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

  checksum       = '44E5DE09C4D3CDD245F4E1B010DB2698A7A538F25C6D9C5B9659FA69C846B68DB3DD086303376D9C397065FA01336E9DAF5A97ED80AA859E4C4C35F4AA0455D5'
  checksumType   = 'sha512'
  checksum64     = '00812974CC257440F02FCC461E7146F1B89904559FBC5610F0F9B76E127D56DD41FF34D6DF6230606BA00A3FAD0863A28B05C0BEAF2FDC25F445458EBFCF363C'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
