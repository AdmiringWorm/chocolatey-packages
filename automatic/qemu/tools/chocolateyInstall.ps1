$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20220831.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20220831.exe'
  softwareName   = 'QEMU'
  checksum       = '78b069f7880277341abfbe331ce7381e3bb60f9c7523892308aa6aad7cfbcaa6d2edb60bcc6a43d35ec4575b25076a991f17cd7c7db9dd99f581599aca2b4700'
  checksumType   = 'SHA512'
  checksum64     = '78a1209d28a2bf70224abbfe6b87e144e127d198c0e280afd66aed4ea3ad6d5beba97478598039c23e44f0dd9c7efe5439734d415fb05aa28d8d624f4e9ed615'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2022/qemu-w32-setup-20220831.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2022/qemu-w64-setup-20220831.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
