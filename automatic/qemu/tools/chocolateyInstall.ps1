$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20200612.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20200612.exe'
  softwareName   = 'QEMU'
  checksum       = '59f86069542de49ca9ce34d9335c208d606bb4ae008a2df0a1f5b51d8af5689d7ac0fda7bdec9ac690163916c3377f5648ce29a8c7fd9680b8311f51849defcd'
  checksumType   = 'SHA512'
  checksum64     = '598628ced050d5bb9441123cc9c4e61280f51916ffbfda7ae8eb7c388aafa8f8bdecf726bf193b1f45a010a4395b025f122123c8873552513932067fb3062076'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2020/qemu-w32-setup-20200612.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2020/qemu-w64-setup-20200612.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
