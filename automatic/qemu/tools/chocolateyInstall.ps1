$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20221230.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20241219.exe'
  softwareName   = 'QEMU'
  checksum       = 'e8380fc1f44264a25a6591cee881842220106c7ceee9087dd229dc56fed1415e79afebfdbf243c71853c4b2a946d2591707f06bed429eda21e31a4d9ed7b62ab'
  checksumType   = 'SHA512'
  checksum64     = '959e45bdde65def2e6870e729425ed21e2ca8a9b5da0c1c74f2da43b15288d3e7f0ae46b633050663d8beeab6d8e9bc3c682276a1f62b74c64143fab994a1c4c'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2024/qemu-w32-setup-20221230.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2024/qemu-w64-setup-20241219.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
