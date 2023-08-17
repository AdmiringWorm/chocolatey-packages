$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20221230.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20230817.exe'
  softwareName   = 'QEMU'
  checksum       = 'e8380fc1f44264a25a6591cee881842220106c7ceee9087dd229dc56fed1415e79afebfdbf243c71853c4b2a946d2591707f06bed429eda21e31a4d9ed7b62ab'
  checksumType   = 'SHA512'
  checksum64     = 'c32b13982ce430ff7f12ea6ac5d29f40ed5a22f5b6115c239905330d53876cf398276b73ab1b35f5c3b292138374b5a356651eb3bddf05c08976a9108ea6e8f2'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2023/qemu-w32-setup-20221230.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2023/qemu-w64-setup-20230817.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
