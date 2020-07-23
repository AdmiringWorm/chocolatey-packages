$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20200723.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20200723.exe'
  softwareName   = 'QEMU'
  checksum       = '78457542355a56076e62ae7b27728be36d69e397acf54e3f641d9e101c1abd07bac53b2bf78f5f11633f3451e80e80da388050da7a34925e448e02b5a2b34c85'
  checksumType   = 'SHA512'
  checksum64     = '443be65f1f2c34e3bd6959dc8753ecdc3898c2baeede6ab30d4e892519d00d2385d4efc52121885ae6a82ab36b2c009f3178e411e534e7c205700052ade2f677'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2020/qemu-w32-setup-20200723.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2020/qemu-w64-setup-20200723.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
