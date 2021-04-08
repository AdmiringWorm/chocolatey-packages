$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20210407.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20210407.exe'
  softwareName   = 'QEMU'
  checksum       = '93b6d523d2e698ff2720319e1acf84194b7b016d5e74b2591130d2e6e2be14a7b888a0f194b944d916cf6243cab495465f96b81e9798378dd2da0bf3a5e94073'
  checksumType   = 'SHA512'
  checksum64     = 'e761e2ac052e500c824a77571bfa6a1268fba32a86b985aedf62a65f74d05253b0d321bab35ad9cca1c7c7d2e05dea2add08a2d27846764f9d773471d97b490b'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2021/qemu-w32-setup-20210407.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2021/qemu-w64-setup-20210407.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
