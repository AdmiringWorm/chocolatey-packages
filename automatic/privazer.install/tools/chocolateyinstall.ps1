$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '2e1d30189a3c899986b06ea8188a1762387744f01155eab6c0ef5b7fd2b0fbe7b8c802511f3e3bc1c5e351c47fbbdb7d8a8dc2cffb6001b4e78546344adfff50'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
