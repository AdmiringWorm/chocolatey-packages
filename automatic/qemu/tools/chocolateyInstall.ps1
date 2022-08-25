$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20220825.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20220817.exe'
  softwareName   = 'QEMU'
  checksum       = 'b4b10a1c0ceedfa75000d7871455019971afcc82be71950d48426d9a8429aa194e755f0dfdb21f75b1b542e0a9aaa223c329276568d2a5e6962391ece13735e0'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2022/qemu-w32-setup-20220825.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2022/qemu-w64-setup-20220817.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
