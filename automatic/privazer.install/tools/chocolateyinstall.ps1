$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/privazer_free.exe'
  checksum       = '8c5eb7dc98a86564e8dc796b4652c42b69f5c43ab56ca8cd204a82003824e85d031ca6f48c844a598073d61d788ea29cef35c334750b5e066028c050a073eb1c'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
