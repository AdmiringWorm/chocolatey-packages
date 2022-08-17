$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20220817.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20220817.exe'
  softwareName   = 'QEMU'
  checksum       = 'dbe993fb2b1883a05ad75b5da1b4bf9ecb976fda2a0d5c32df7f64158f5bc117d361ad5fcea177381753d3b73b43a633988f7c5b35f7eb59eb3d244462655b70'
  checksumType   = 'SHA512'
  checksum64     = '3b984725cf5ddb6be231f5f6913a361471772137f4c8abdb1fe882c9aeb8afdf74fbea111f7a03cd98bbe30c943943ebdacdac70b3fd6ff086a3a91f3abeac62'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2022/qemu-w32-setup-20220817.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2022/qemu-w64-setup-20220817.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
