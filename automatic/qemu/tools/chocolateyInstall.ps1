$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20210408.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20210408.exe'
  softwareName   = 'QEMU'
  checksum       = 'e9c7346fa1c2de8b7441da943793d19d69a4ccbd5a6d85673c74e93878cb6b98edfcf49ae7aab93b6eb9246fa506136b78598738ff85f0f2da1bda53082998f2'
  checksumType   = 'SHA512'
  checksum64     = '92c56eaa80e414e681c4eb36b809f17d2dc3aca75acb24db0cda5523ea9c04b2d3a3ef2fbd9066f570ee17393adc4c13aca9688e2fc4930bc16f031f49ac4a54'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2021/qemu-w32-setup-20210408.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2021/qemu-w64-setup-20210408.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
