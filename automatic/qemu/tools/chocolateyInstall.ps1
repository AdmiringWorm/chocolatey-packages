$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://qemu.weilnetz.de/w32/qemu-w32-setup-20220805.exe'
  url64bit       = 'https://qemu.weilnetz.de/w64/qemu-w64-setup-20220805.exe'
  softwareName   = 'QEMU'
  checksum       = 'ea6d802ae58224a45c75e411915eb44242027e6b6b3882becabb5c5a928859518bf8a08ed38ab990990f0a45ae7fc522bec43b7a7836e9f5fce157d3517a9a81'
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
  $packageArgs['url'] = 'https://qemu.weilnetz.de/w32/2022/qemu-w32-setup-20220805.exe' # fallback32
  $packageArgs['url64bit'] = 'https://qemu.weilnetz.de/w64/2022/qemu-w64-setup-20220805.exe' # fallback64
}

Install-ChocolateyPackage @packageArgs
