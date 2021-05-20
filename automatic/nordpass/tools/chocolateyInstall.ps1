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

  checksum       = '2768958D344754DA89CF3FE9523737A3A10FA1D62FD2B6081D88255B95027864561CB792530B4987B4F699FE599560CB44E52DF9171743D10D88DA647D7FB169'
  checksumType   = 'sha512'
  checksum64     = '6CE13156329C2472E12B3D8844FBF0DCB45A8A8B91F6529CECEB5A2F987543BC21F969BEA5986287D262E09C1D89F2CCEF5DBC5633C5D5E02E92639B106C2EC3'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
