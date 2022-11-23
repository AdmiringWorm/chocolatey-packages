$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20221123.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20221123.exe'
  softwareName   = 'QEMU'
  checksum       = 'b2c7d9f68df233eb9010453f4ece43417444e85ab7877064b26a166c3f1e9e533f6e2b19d5e8abfb2af1c0d2bbd83f94f3ea5dcefdeca0f5b9942f2b65c8801b'
  checksumType   = 'SHA512'
  checksum64     = 'a45ee35f58d9ebe941d582b297d2e0c0bc0fa4b358bc78c7f38e78ffec5cfeb6f93735289ae4ee74d196290c2c26efa70c6f80ce1ba19126e533fa9a7580573c'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2022/qemu-w32-setup-20221123.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2022/qemu-w64-setup-20221123.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
