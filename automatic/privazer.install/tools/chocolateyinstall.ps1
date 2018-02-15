$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/privazer_free.exe'
  checksum       = '72c32e9664a63f4476fac59591d2527d805787d6774f5b644623a324e717a78c87db6606cbf6dfdb32fbebcda5a66fc0302b4a67c4d52ddf94f933f83be82224'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
