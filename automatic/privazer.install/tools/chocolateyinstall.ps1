$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '4eaccb92ea73590559ccd6793903541d0bc1bf8db7669917288b18cfd8645db48a5bbf7067864dab218facc47e7913f657be8da56b5b6bc1099ef52aea6d889f'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
