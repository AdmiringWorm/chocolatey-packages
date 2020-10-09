$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '37d06fff2eaa0cfe2d452bf45a682aaea8fd5ed30ebaee1af208ee4897200429610891112afe677862a97f4de1711d6fa844219a491efa54e8926b4078e1bb9c'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
