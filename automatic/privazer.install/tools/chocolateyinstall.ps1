$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '1242a22a5acfa45dfe395d8b19c416943e08a0f4d8baa619236540078efa63d489193e62cd9eb39ce7266a3dee9f4f36877ddaec8fcaee1e83f4897dec43e98d'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
