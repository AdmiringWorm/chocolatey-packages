$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/privazer_free.exe'
  checksum       = '8001165242a3579860e29adf3090ae7bffcdfd753de3ab4e3e1ccf5f17f6c9b4ce4914aacdb0eb32df985f25fa8042aaf67e28983f780aaeb80212a15dbabd5c'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
