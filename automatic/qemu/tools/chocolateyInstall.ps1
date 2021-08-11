$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20210810.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20210810.exe'
  softwareName   = 'QEMU'
  checksum       = '98e9bd0aaba9871208c406949ad1c774a19e3ced3fb30a0897032369e5e3a40c690aa678dc52b1c5b260b5748e92755a6cfc2b7d50b5c3caec0733fafd2b0d50'
  checksumType   = 'SHA512'
  checksum64     = '1dbd0973190a6f3b8d61aee7bf20f07c4b713e3613fcb03bedcabf4a519a2e8a7843fff4007114430596ad016a0f8fc56d402d5ba587c62dcc1f4897995789ba'
  checksumType64 = 'SHA512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

try {
  # No need to test both 32bit and 64bit
  # if one have been moved, then other should have as well
  $headers = Get-WebHeaders -Url $packageArgs['url64bit']

  # We will just continue, as there is nothing to do when previous command succeed
} catch {
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2021/qemu-w32-setup-20210810.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2021/qemu-w64-setup-20210810.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
