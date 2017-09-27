$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'privazer.install*'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'http://privazer.com/privazer_free.exe'
  checksum       = '62EF86C359ED894D447B60F8FEAC14633DFD32FF9A4B7746B91763B50B138E98'
  checksumType   = ''
}

Install-ChocolateyPackage @packageArgs
