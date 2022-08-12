$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20220812.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20220812.exe'
  softwareName   = 'QEMU'
  checksum       = '42d3e5148aa9060c0c6e49880a0e2db03ce0a162f5d215d3bb63d935d2a0b80a9101fcc805dfe471f69a9b7177395dae94f6c8dfab133efa47863da215164d29'
  checksumType   = 'SHA512'
  checksum64     = '41de36b21e6ce98c196fe5aff49810dbee665e7742da7a6d3762b3e6f513411a96f0e29d84e4dbb8fe94b4823ffcad21b550995a49cf8958dde1540d82b5cc9a'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2022/qemu-w32-setup-20220812.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2022/qemu-w64-setup-20220812.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
