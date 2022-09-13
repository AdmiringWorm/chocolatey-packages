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

  checksum       = '55C0D2E8801522EC8A2285662D0A629F54B3F3DFAA57E91FF0644FE0AC011892461269E80EF28A21DA46E1AD5A035171196AF10081683DDE5E721DE0995D9563'
  checksumType   = 'sha512'
  checksum64     = 'C015ADEDF187203FB4DDC1B6D1572DD0275E0296BF8312A51E0463C4F943AA55FB0DE17DF3150DE9AB1DAC3894D53A5DCF8879D7E0750AEAB881A48D6CE067A6'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
