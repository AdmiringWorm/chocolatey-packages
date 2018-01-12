$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.2.1.exe'
  softwareName   = 'Cacher*'
  checksum       = 'da40300cd242240bfe8ae2adb09f13d0432d664414a57e9da3a0f9b3183c78ebbf58726a1f884cd927c2ed3f3ec85c4034a8bc651bc0f9d621ee07807f33e565'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
