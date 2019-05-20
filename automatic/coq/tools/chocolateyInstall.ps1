$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://github.com/coq/coq/releases/download/V8.9.1/coq-8.9.1-installer-windows-i686.exe'
  url64bit       = 'https://github.com/coq/coq/releases/download/V8.9.1/coq-8.9.1-installer-windows-x86_64.exe'
  softwareName   = 'coq*'
  checksum       = '6aab12fce6d919a474d4f46a909d5ea1399b8e20c2fd38173d0dd2b3ed87860f'
  checksumType   = 'sha256'
  checksum64     = 'd388223276b4624e6ff16c8e1b620cf36b0817edd32dcebdd48d41898811e469'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
