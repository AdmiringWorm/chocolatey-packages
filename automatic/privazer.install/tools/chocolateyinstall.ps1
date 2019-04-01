$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'ccf87f2a8a2739314478ea06f371a72e5b8454b5173a7fb470e09a752a24a89d086d780a59408da13f8b24092e671a0e8a1f104bb11b7a0077c53974d07e5dc7'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
