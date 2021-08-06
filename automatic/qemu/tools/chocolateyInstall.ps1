$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20210805.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20210805.exe'
  softwareName   = 'QEMU'
  checksum       = '8693f37ac451027b696a638ad0b42c12d32e43ebf36b6cca7066e30e06c2b2c2c9c9281c130db36277f9c0229747f15fe679bd1054107a633d00d6e273466e82'
  checksumType   = 'SHA512'
  checksum64     = 'f4e08ffc6c68e2651131145127eef81d857a1c27b27d01eb940e7472ee9cb16b5f3ffe3e0dbacba9820c578f3785f6b3f7fd16dcd7491a220216b69f33adece0'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2021/qemu-w32-setup-20210805.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2021/qemu-w64-setup-20210805.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
