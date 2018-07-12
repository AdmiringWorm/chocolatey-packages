$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/privazer_free.exe'
  checksum       = '13542fd2110205902e8b3bcc50bfbfd59c6983038c5e8ae6def6f1a1dda225f247ab2df511805885f8e702de83bc325ec6feba8267f859bef167cd98ea4e8244'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
