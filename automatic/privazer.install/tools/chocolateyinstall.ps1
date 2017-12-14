$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/privazer_free.exe'
  checksum       = 'e3af004d473b5f7f433b69d7d690e9d7f6c19044fc1365a07d51e916a5bb579578afc8fd2f5d17e500574c78d591ccd5d77d4faeda7b5059c40c42ec36d66dbd'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
