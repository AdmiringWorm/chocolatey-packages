$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20221230.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20241220.exe'
  softwareName   = 'QEMU'
  checksum       = 'e8380fc1f44264a25a6591cee881842220106c7ceee9087dd229dc56fed1415e79afebfdbf243c71853c4b2a946d2591707f06bed429eda21e31a4d9ed7b62ab'
  checksumType   = 'SHA512'
  checksum64     = 'f0c45849d75ecc75fffc29448741bbfdd732d3bea6f606d7f1a8bc3543845cb25ce0a0b5c716d4661d954877c907007a9d96c6136d015fb96afad29e57687bde'
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
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2024/qemu-w64-setup-20241220.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
