$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '7a009e9d7afa84fa77b33f8da6d5b502e2da025685d2db339cffffeaaaf7905356791d6934bc79f546b21a52b85854f6a71ef0ea9f505666b92608066cb48174'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
