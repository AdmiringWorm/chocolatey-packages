$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '0ade635a8632733e26f3f02dc3e1db59bc8da35e1f4201a981aea18d70a451cecbb609b302090514f40bce4dccf85297e207f5bf63e51a67a42ebea020cc985a'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
