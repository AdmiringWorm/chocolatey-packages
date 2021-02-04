$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20210203.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20210203.exe'
  softwareName   = 'QEMU'
  checksum       = 'b73408e21212665dfaccfa1170bdc4d35754b8f3eabbfe56c33d4b6e311298efae007ce0484fd8602bcd172dacd8ac6768d1ee19485baa7c2be3e755495d15d3'
  checksumType   = 'SHA512'
  checksum64     = 'f93423fb42086fbd770bb8dee4e8fdaaaef46bdea178fb4407823d0a8463ad06eac07d2f7894e301dcf80a2d2eb25204c9f48b05d475ef0b56dad27e6b3565e0'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2021/qemu-w32-setup-20210203.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2021/qemu-w64-setup-20210203.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
