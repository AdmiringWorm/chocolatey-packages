$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://github.com/coq/coq/releases/download/V8.12.1/coq-8.12.1-installer-windows-i686.exe'
  url64bit       = 'https://github.com/coq/coq/releases/download/V8.12.1/coq-8.12.1-installer-windows-x86_64.exe'
  softwareName   = 'coq*'
  checksum       = '6f1b06fd11a5e645613f08d742415a55f8d2bd27c2a762ecc73e7efae7bfb5b5'
  checksumType   = 'sha256'
  checksum64     = '6a287c3b7b783064485561386194c3460b30e7210cf315b95eaeb93402150680'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
