$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20221230.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20240327.exe'
  softwareName   = 'QEMU'
  checksum       = 'e8380fc1f44264a25a6591cee881842220106c7ceee9087dd229dc56fed1415e79afebfdbf243c71853c4b2a946d2591707f06bed429eda21e31a4d9ed7b62ab'
  checksumType   = 'SHA512'
  checksum64     = '74c21fb55713587daefa7d7163887efa9c5017993acb2816cbb5057a820ac1df973316fdde2e5795f0c1975d6b31093b4c72b60ae8a9415f07d27124dde8f1ea'
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
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2024/qemu-w64-setup-20240327.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
