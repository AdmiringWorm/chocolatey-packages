$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20220809.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20220805.exe'
  softwareName   = 'QEMU'
  checksum       = 'e97eca9be6cb942ec124020f8a8460a0d769318f3b59e071843e52b1890b222f34aef59f43aeec754d4c1dac06fb01911cce8d2781d18160dff14d2bae596022'
  checksumType   = 'SHA512'
  checksum64     = '8dec5b043e9de94111343c89f009fbb7f4629820c3996309407c703f7eb4ccadcdefe822aa588c60175d9bebe697780eb00deb1b18fc07701cefed4bfd150415'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2022/qemu-w32-setup-20220809.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2022/qemu-w64-setup-20220805.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
