$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://github.com/coq/coq/releases/download/V8.8.2/coq-8.8.2-installer-windows-i686.exe'
  url64bit       = 'https://github.com/coq/coq/releases/download/V8.8.2/coq-8.8.2-installer-windows-x86_64.exe'
  softwareName   = 'coq*'
  checksum       = 'ccc220d0f7425dbfde2bc825e9a3d0c51d9fa1aa907a573de0b9b6bfa00236ef'
  checksumType   = 'sha256'
  checksum64     = 'f60b842e508546e955bafe9d61d2c997d3848814e3ae79f7e5deed996838165f'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
