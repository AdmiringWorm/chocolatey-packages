$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'a2ec2d1cfbe7d4919879a1e50c78f26c70148327e20b37b59ba89f4794e42528887169bb842734186e944c86897f1e25a47d0b027013aeec807402d65eff9a80'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
