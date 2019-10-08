$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://github.com/coq/coq/releases/download/V8.10.0/coq-8.10.0-installer-windows-i686.exe'
  url64bit       = 'https://github.com/coq/coq/releases/download/V8.10.0/coq-8.10.0-installer-windows-x86_64.exe'
  softwareName   = 'coq*'
  checksum       = 'f6ee35d91b5963d2069b73e5592720524ee28e75d914c045fb780874316c1cfd'
  checksumType   = 'sha256'
  checksum64     = 'ee0bc7fbf7b42bb3e46d497379355ec9b30bd8d5e69ff6af576d538389683ded'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
