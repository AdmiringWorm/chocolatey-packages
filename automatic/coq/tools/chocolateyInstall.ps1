$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://github.com/coq/coq/releases/download/V8.9.0/coq-8.9.0-installer-windows-i686.exe'
  url64bit       = 'https://github.com/coq/coq/releases/download/V8.9.0/coq-8.9.0-installer-windows-x86_64.exe'
  softwareName   = 'coq*'
  checksum       = 'f09433a6429f3801b10fba227b4f859f7d87f894379cc7266a240af0d8a2e01c'
  checksumType   = 'sha256'
  checksum64     = '26e11e8b14dd870525b229dde169f4f2e2c0fea9ee4704b5358554f553d83918'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
