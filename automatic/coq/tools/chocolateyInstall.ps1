$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://github.com/coq/coq/releases/download/V8.10.1/coq-8.10.1-installer-windows-i686.exe'
  url64bit       = 'https://github.com/coq/coq/releases/download/V8.10.1/coq-8.10.1-installer-windows-x86_64.exe'
  softwareName   = 'coq*'
  checksum       = 'f7138651b1614ea9d4cd105bd60f192ffac77b6e51dc766684019e7ab4348ed5'
  checksumType   = 'sha256'
  checksum64     = '6bacd5e727bb3d9a405dea880e21453fbd2d6a24524454aa32e2b7ab81c1e638'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
