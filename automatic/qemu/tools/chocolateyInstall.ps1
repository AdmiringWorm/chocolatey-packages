$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20210409.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20210409.exe'
  softwareName   = 'QEMU'
  checksum       = 'f6325951435530fe676fa6fcd4d3e6aa040eb027487cef9a628e874fff6df51d693e34bf1a00eddf703e02b65b4a40d44c1e0e0e74ff493f1a9d19b79bd8a37c'
  checksumType   = 'SHA512'
  checksum64     = 'ce90925bec415aea3916a32c3310e14b8c2ba03db1952770d1522e53b19da078d5eef6e406a6a79fbaa2880d3d302f1fbd0d3a7080077085d7db4089c2825b9f'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2021/qemu-w32-setup-20210409.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2021/qemu-w64-setup-20210409.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
