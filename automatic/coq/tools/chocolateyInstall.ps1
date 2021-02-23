$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://github.com/coq/coq/releases/download/V8.13.1/coq-8.13.1-installer-windows-i686.exe'
  url64bit       = 'https://github.com/coq/coq/releases/download/V8.13.1/coq-8.13.1-installer-windows-x86_64.exe'
  softwareName   = 'coq*'
  checksum       = 'a67ddd3041b6149cdc6d4d80fc4d4be231ef35f0c0866d3c6a5bbe2ebb500175'
  checksumType   = 'sha256'
  checksum64     = 'a64e58692c2db894f520d047e07c9c6a53ae8571deacf4abc0f113cd1d206d08'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
