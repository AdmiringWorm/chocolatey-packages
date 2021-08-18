$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20210817.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20210817.exe'
  softwareName   = 'QEMU'
  checksum       = '2b377911948ac64cef4715deca857c50051e5d1c6bf2ebc45e73405890cab74bcc5ff302ce74582fb75e05598016e59a633fc88c4c83ee66590cc5616650cd60'
  checksumType   = 'SHA512'
  checksum64     = 'db54619d642b06629939229338a838bf43ea19eda416267a1a2b062b9181b42f409e2b690073be2f36996c23eb6371f1f09f3014a4c8cf0a86b48397bc4455a8'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2021/qemu-w32-setup-20210817.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2021/qemu-w64-setup-20210817.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
