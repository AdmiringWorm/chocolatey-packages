$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20201120.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20201120.exe'
  softwareName   = 'QEMU'
  checksum       = '9aaae87eef6de12a01598b05a01e633b4023f1b574a523bf7265f22233237ff004b2e2b1486c12e7a2427f5ea61c662f14cfc2257ff48e8761b370bdc4b5a72a'
  checksumType   = 'SHA512'
  checksum64     = '2f36592722f11011ca47bc5df9977bf33b6de9201a980ad0e539ab996bc4f099d04899ded860d8af5cd6cd08ce9cc3380a715c8064ccf2f43d7789c41884babb'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2020/qemu-w32-setup-20201120.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2020/qemu-w64-setup-20201120.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
