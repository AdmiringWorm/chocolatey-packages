$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20220804.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20220804.exe'
  softwareName   = 'QEMU'
  checksum       = '57622933bc8dc6084712ae2c23c17636c2d475c078c99eb59c8a6f90f56f9d71a54574742ac324306f606868ed20297558127906e118029cb8217c2037f1331c'
  checksumType   = 'SHA512'
  checksum64     = 'e6c5b830381ffa8ffc1bf5514cc7da6a08710a8c0490e0d463212b40eaa411fadf88b176405dea57d5ea14511556c2a57a4e45422dab718882a6d6f763cfbeb7'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2022/qemu-w32-setup-20220804.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2022/qemu-w64-setup-20220804.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
