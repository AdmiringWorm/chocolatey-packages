$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20210825.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20210825.exe'
  softwareName   = 'QEMU'
  checksum       = '52dc3c0cb58c744e6f3175aecc655772e47f234b8dfda2c54ead3e6d9b31b12f412daa824e6d1ba7e9bda77428021a8aa77e55ea69a58dc6d1ce511bd0e68c6d'
  checksumType   = 'SHA512'
  checksum64     = '837b6c0307878233f1e7a19f020b421e0765b981c5f2c40c26141dcafbe89011477d88dc6885b4d73c9368acdec37ea92ef32b945a0581d96404a15a1db9ca9b'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2021/qemu-w32-setup-20210825.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2021/qemu-w64-setup-20210825.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
