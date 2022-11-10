$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20221110.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20221110.exe'
  softwareName   = 'QEMU'
  checksum       = '30c231a4cd66a0a5e370706b0827b5b8fc8b197f7da19d0a0b4f690df5121d333014dfba3c42a9a5503ef2447c1df5f809ccd923c5c010edafe6b18f0875531c'
  checksumType   = 'SHA512'
  checksum64     = '123bd3537c5483210e2f2a5697727d878f9a5d136c5d7fd58e0216dc834165df9c77461e11ef6135652de69aaf9f90db241203cc7c0de5bc24ff6b457532aaca'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2022/qemu-w32-setup-20221110.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2022/qemu-w64-setup-20221110.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
