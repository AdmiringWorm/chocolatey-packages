$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20200814.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20200814.exe'
  softwareName   = 'QEMU'
  checksum       = 'eed3cbd8fb5ddd98af7f4297b0b98feb8da605f289b2c5413bd6eaa5768ef885c1a3478a8369aad355bad6340ae8997fd867ca62989b1ef2147d6ed53e36ecf0'
  checksumType   = 'SHA512'
  checksum64     = '89fb2b94c924717cf1864613da65b8a0b2db4c4e7a6f41032c51d96e2615d00a7d3a8fdf89e86f77ff622bdb41159bc3bf42c9098deb2d9dc874345b43e32670'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2020/qemu-w32-setup-20200814.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2020/qemu-w64-setup-20200814.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
