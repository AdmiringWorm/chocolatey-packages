$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20200201.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20200201.exe'
  softwareName   = 'QEMU'
  checksum       = '57eb8a7c33f1a4326fe6a8267658170943d02468cb8d1afa1f1eaa67552e49f4b4010bbd6810b9d9162fecd4a1a471bade7539af23e78e33a25fc67505b4cdd0'
  checksumType   = 'SHA512'
  checksum64     = '42d8d2080b5f46eb2a1439adfccf610a501865841eaff2b141adf991935d9e4b0c6681ed70f34a6ccf0684bc9f34fa80bf7dc5bb9c336a8e58c411e78936d25f'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2020/qemu-w32-setup-20200201.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2020/qemu-w64-setup-20200201.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
