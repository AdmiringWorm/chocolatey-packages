$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20210505.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20210706.exe'
  softwareName   = 'QEMU'
  checksum       = '90306a6166b576f7077286ec4143120ba35a4ad1bb3108c7c2d2ac7c72910a54aecc89dd736093c3c7d90278f0945898f08249d6c82fdfd0643e610ea83a7a9d'
  checksumType   = 'SHA512'
  checksum64     = '96e1d72cc3b7bffa29d3194d664d1459d0f59bb3802c019d704a8936b9d0afcaa77e625958f790584d13f156635e6826a9273d301253f3370b2886e1dc158d39'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2021/qemu-w32-setup-20210505.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2021/qemu-w64-setup-20210706.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
