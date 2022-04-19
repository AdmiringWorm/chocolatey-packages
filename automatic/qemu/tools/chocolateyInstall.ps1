$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20220419.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20220418.exe'
  softwareName   = 'QEMU'
  checksum       = 'be4aeb1893e5d48d74d9a569387ee6dd61b7793d5ef7b2614ac3672458cf08e48164b90f548b213063be64c108cd6965a8d56c67d486f889b38a9449f750d9d4'
  checksumType   = 'SHA512'
  checksum64     = '89390b91e04b8f87ccada4f31e52a18e3d051623f3099dadd5e98ce3f5b3b533b69d675e85cd832841180c2b89e0251ea434cd4c8ee759f5e0c8c4a5d9752c38'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2022/qemu-w32-setup-20220419.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2022/qemu-w64-setup-20220418.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
