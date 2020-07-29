$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20200729.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20200729.exe'
  softwareName   = 'QEMU'
  checksum       = '24b3439dbd8d58b338c519ae2e45d5918476d26bb2dcd5da14ef85ee83b2d37be4910ef46b87e57e9adedb037475ae9ed4bee5f8c8354b25145c2e67180fb42b'
  checksumType   = 'SHA512'
  checksum64     = '6365367be79c1d74c8babc4a85a900954a979cdb84ebf15000d68d6efe4d654659c81a10565c2c920fff8add0d3b5297f6186583584fc6b6873a797dc1ea33d0'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2020/qemu-w32-setup-20200729.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2020/qemu-w64-setup-20200729.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
