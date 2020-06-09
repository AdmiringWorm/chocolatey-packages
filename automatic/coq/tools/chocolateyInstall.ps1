$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://github.com/coq/coq/releases/download/V8.11.2/coq-8.11.2-installer-windows-i686.exe'
  url64bit       = 'https://github.com/coq/coq/releases/download/V8.11.2/coq-8.11.2-installer-windows-x86_64.exe'
  softwareName   = 'coq*'
  checksum       = '8da902232a5e560bee3ae4498466144da36db09de3a0051e94c33f53b5ec424e'
  checksumType   = 'sha256'
  checksum64     = '26b04bffd904f91e508be99dfda7d8c5b3521c1ea98f76c29dcf4876fa4733b9'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
