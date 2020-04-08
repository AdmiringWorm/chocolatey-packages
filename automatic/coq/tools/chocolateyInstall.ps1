$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://github.com/coq/coq/releases/download/V8.11.1/coq-8.11.1-installer-windows-i686.exe'
  url64bit       = 'https://github.com/coq/coq/releases/download/V8.11.1/coq-8.11.1-installer-windows-x86_64.exe'
  softwareName   = 'coq*'
  checksum       = '938f47bdecbff46ba7d6bcf4f457d73b4b4326f763a46bf7a283d78e4af9e782'
  checksumType   = 'sha256'
  checksum64     = '6b87c855395da2eeb8a703e762e0917016d91385b0e7c3a7508ed2c1aa24f26f'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
