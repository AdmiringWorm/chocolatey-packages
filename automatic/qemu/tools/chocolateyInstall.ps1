$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20221230.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20250826.exe'
  softwareName   = 'QEMU'
  checksum       = 'e8380fc1f44264a25a6591cee881842220106c7ceee9087dd229dc56fed1415e79afebfdbf243c71853c4b2a946d2591707f06bed429eda21e31a4d9ed7b62ab'
  checksumType   = 'SHA512'
  checksum64     = '5e6b88318ab1233e6d9cea187f657a8d69c5007fbaaee18c57383abbadf080c2731ccdcfe5c12b021b344b285b4bf2d69f6c80124714a2ac7d5f6a46b7297ccc'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2025/qemu-w32-setup-20221230.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2025/qemu-w64-setup-20250826.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
