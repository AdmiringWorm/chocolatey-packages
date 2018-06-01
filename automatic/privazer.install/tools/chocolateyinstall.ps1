$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/privazer_free.exe'
  checksum       = 'b09a8bf5e994166e72cb5efeec87162a0b84309b726d146f8eed8cfa1f7864a7220b0b4863c4b4ab2a141401283d5201a309fb59bba86e6f3e27a83bcef1bbae'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
