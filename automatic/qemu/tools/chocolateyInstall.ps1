$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20200722.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20200722.exe'
  softwareName   = 'QEMU'
  checksum       = '675d4b8e7ef6c56da00f296e420250a9315bdba343a4ebf7b3dc30f0082caafbf7c239ec80493b9c11e94442df7ac61be8f653b1b55dde28d49cd619e2b21ce8'
  checksumType   = 'SHA512'
  checksum64     = 'e1b7ceacb468a726e384c35ce67ef0f01ee4c3a66eea0c5fbb77c161415a11eb300a88a832f92c9df5b251765cbe828f9f0025a4b84b85f0649d5980c09d8889'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2020/qemu-w32-setup-20200722.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2020/qemu-w64-setup-20200722.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
