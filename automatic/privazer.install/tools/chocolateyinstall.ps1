$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/privazer_free.exe'
  checksum       = 'a25897d57992da9f0a43daa5377aac29bca932c7bf2c126429e365a6dd3097528dc114422fe8b9edc684752e93939ebb18c18f8fa14bbb29bfbd235b2e4cbafd'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
