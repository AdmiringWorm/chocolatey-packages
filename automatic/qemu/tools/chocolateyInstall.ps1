$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20201124.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20201124.exe'
  softwareName   = 'QEMU'
  checksum       = '44a2140d31d3549296865a4a548dafd1d28613b37a4c473a31bb76e6cf17f0e2c723aa2a698f8e359e5894ef3fe31a69cc392045d29241e2aaf77369d7e9777b'
  checksumType   = 'SHA512'
  checksum64     = '90d3b4960edd06600b1cb2abeb94907cce6efb5a0afaa0414428d0de0aae01206f39df3882f0e9bae4b568d7d684d3caae125215989a493bb008bbfddad6aad7'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2020/qemu-w32-setup-20201124.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2020/qemu-w64-setup-20201124.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
