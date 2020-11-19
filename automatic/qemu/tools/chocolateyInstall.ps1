$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20201119.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20201119.exe'
  softwareName   = 'QEMU'
  checksum       = 'be417cc6e6e23e2cc7bad97517f90927cc3f2d0032309b13fb533e8ef8c1c0daf825c36cb42c98d19d0478fab8d7fec76cb2b7e3817302590c1fa7107966f8b1'
  checksumType   = 'SHA512'
  checksum64     = '2709918786e53a050c0d461bb033f302ca631b24e06481688bfbd9b5139031fd77df5952adcd537e45b81a440321e1f8e86fb41620b5b92bd0ff89a8df228ec9'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2020/qemu-w32-setup-20201119.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2020/qemu-w64-setup-20201119.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
