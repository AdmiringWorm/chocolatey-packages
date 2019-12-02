$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = ''
  url64bit       = 'https://s3.amazonaws.com/authy-electron-repository-production/authy/stable/1.7.1/win32/x64/Authy%20Desktop%20Setup%201.7.1.exe'
  softwareName   = 'Authy Desktop*'
  checksum       = ''
  checksumType   = ''
  checksum64     = '87624bb1e4454d48e99a9d08658adc2406a7cbbf6c3c9ecd75065cfb1fb17df5b37974cdc47e55282a8716afe16f3175d11f62360ad0643d781fba418cad386f'
  checksumType64 = 'sha512'
  silentArgs     = '-s'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
