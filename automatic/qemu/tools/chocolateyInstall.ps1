$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20210721.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20210721.exe'
  softwareName   = 'QEMU'
  checksum       = 'c88b09538fbd28f421b583a4d33cdf71179217a87f9aaa12407d943898287b0070a8f704bab6ff9381917e1199e1335be8f3b61b4bc53257184c18861a02a53b'
  checksumType   = 'SHA512'
  checksum64     = '31ab8a4b2792f3d11b468ca812a9036f96a429bd1ff4c410a4694de5bfedf651488ff1fa0d6672daa9a9a198056f38403552c1b214cf9a4fca72a049d0ea3e7a'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2021/qemu-w32-setup-20210721.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2021/qemu-w64-setup-20210721.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
