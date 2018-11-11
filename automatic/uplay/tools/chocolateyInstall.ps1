$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = 'D23672DCB0EA0B6782AAF47008A4017527B87E5BD6028868F9B6D01B16715BE573FC29E63ACE730D487990E6124FFFB7E6ED464AE09B08ADD6375A17D75CAAEA'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
