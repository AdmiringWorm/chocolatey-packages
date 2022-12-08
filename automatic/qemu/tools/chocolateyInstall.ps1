$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20221208.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20221130.exe'
  softwareName   = 'QEMU'
  checksum       = 'e309efe4242a9a5767528bbeab05a5876c457a4d0d0b78b0cde5a3c677a7d33ad561366bc3162187c5dc591ace9ae7968664edbbaac8e5860bc72094659dff1c'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2022/qemu-w32-setup-20221208.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2022/qemu-w64-setup-20221130.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
