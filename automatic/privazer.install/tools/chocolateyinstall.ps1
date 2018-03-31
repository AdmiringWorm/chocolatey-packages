$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/privazer_free.exe'
  checksum       = 'f56d3ebbc3fe84ffa2d1e475f0f5db6b0a4a2002dbb4622bcd8552a3c0f89747851381f8dfd948cf85f909dba44eac621faf2bff705199a8b7cc9cda18bd5551'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
