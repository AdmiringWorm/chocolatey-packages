$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20200805.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20200805.exe'
  softwareName   = 'QEMU'
  checksum       = 'b6d96db26c75c42e406760b5180e99b1aac1a0a89dcfafaf10b2cdd6a6801ae7ee012f462ce8a97a83261e3e6e6276c940b2be938cd4643d7e748e3b2d1c4ad5'
  checksumType   = 'SHA512'
  checksum64     = 'b1a04a2815fd846ef39fc8451d89857368c1be85968771f0f8c3a196fa136eb32d1fcf224500141bb95632e30b7307c0e1b5c7fe7ba2c698c1da3750f23fca2a'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2020/qemu-w32-setup-20200805.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2020/qemu-w64-setup-20200805.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
