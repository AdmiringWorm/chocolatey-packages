$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20210806.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20210806.exe'
  softwareName   = 'QEMU'
  checksum       = '909867520dd28fb7d41be5f9f1b18535efdbd99853c0e0f8174432a8bb7cd470e16d161f6b086dff3cdc7e7f3f936aa25186795892f03a3f5cf03725672436ba'
  checksumType   = 'SHA512'
  checksum64     = '8ae004f16dda73eada596aee59cbd388d1d8766c29d2cf61ddb326020fe42c4305bae1767203e570e2dfd3b59985bad12f9c6688201e1ce0cd487e035f75f0fe'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2021/qemu-w32-setup-20210806.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2021/qemu-w64-setup-20210806.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
