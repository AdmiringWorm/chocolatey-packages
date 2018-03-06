$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/authy-electron-repository-production/authy/stable/1.4.0/win32/x32/authy-installer.exe'
  url64bit       = 'https://s3.amazonaws.com/authy-electron-repository-production/authy/stable/1.4.0/win32/x64/authy-installer.exe'
  softwareName   = 'Authy Desktop*'
  checksum       = 'a589828e4a2523278b84c44823913e70d64b3c420a3c05367e2a7efbee6657e666e1f8d49a9bac2f2cf28316e8f2448d0cedb012bf6b43ee3e5d8646352dc71a'
  checksumType   = 'sha512'
  checksum64     = '37e4370b2885f8193d25d5fed8f4e4687cacc43e5a84d763da6a246c02840aa63dd4fb7ed25c5faefcd1390ba16c11feea536d03b2667466fc35b0bffa8907ad'
  checksumType64 = 'sha512'
  silentArgs     = '-s'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
