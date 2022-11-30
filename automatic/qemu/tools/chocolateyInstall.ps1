$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20221130.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20221130.exe'
  softwareName   = 'QEMU'
  checksum       = 'ed1bec36450d18c49cc4fee50cecc62939496d63696770096c3b0ab2827db63bfea5bc51ada57ee6f9a905a1fb3dc41b8c33193137798adb93b04a8ddf1f7632'
  checksumType   = 'SHA512'
  checksum64     = '7010fed55d8a1c20e03f8f855e006ee1f8d0ee64ce358619e39cb0b43357d2712109fb11f8232e6f36a326d9babc4cee39addcf2d740e0736ee4ee0e8d4cd3a8'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2022/qemu-w32-setup-20221130.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2022/qemu-w64-setup-20221130.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
