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

  checksum       = 'D8F2F09445E7778F2B8685BF7E0B517635E3C21CC01F0D2A9338FB89005BC4006B4C03CD658D96439F57B69103CE786DA86EE50FEFADEC22F5FEB8A89076079D'
  checksumType   = 'sha512'
  checksum64     = '841F9C7BB25A5BA8F4E27E3A880599BD29C12CCA36B7B8976C235D66D16ACC8EB8F60E8E2B5212AFF994DFD0E9AD663C7A216EAC7DF40C85F8B950BD7A34F300'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
