$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20210201.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20210201.exe'
  softwareName   = 'QEMU'
  checksum       = '677589e306bca81564c6f82511b7179366fa3d3ddc6bfdde8f281ec3c4c3b9a953d31991042532fad7a7a3ee54a2e892caeb340e9d7877e164d93c6826a4c5f6'
  checksumType   = 'SHA512'
  checksum64     = 'd62bcec80955175e1c83d973a3a08486c435ccac25374d27a1c6de5ac18f9efa09a440c70f4d8fea7ed5025108d4833bb146614dabe170c082381fb0069a4c96'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2021/qemu-w32-setup-20210201.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2021/qemu-w64-setup-20210201.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
