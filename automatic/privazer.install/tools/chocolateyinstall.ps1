$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '974fbc6a354162e86b5b65c4211bdd7cf3c8625a99c83f0c7b8e12a4bcfedd4872d55d846745eaa93bd497c137938df4966db138c07fdef8bec678cab869ef10'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
