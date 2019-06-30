$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '26524090efeb8d7cbbd088f684c5fd228013dfccb9f6cff199463c1fcf34f1c70b8e1f77e985684765b03c4194d0ab5e203544eecda0d56214cb16660ee4c936'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
