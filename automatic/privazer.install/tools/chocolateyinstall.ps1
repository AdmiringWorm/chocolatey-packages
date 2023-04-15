$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '134fe5772e795cd8322664b9117d2d07bd4c3944119ca22cdb07bc11efdc2e80f17be13aa4f04a335e8f9189b04927886069e39e7ffcf58205c1e2e0c4006cb5'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
