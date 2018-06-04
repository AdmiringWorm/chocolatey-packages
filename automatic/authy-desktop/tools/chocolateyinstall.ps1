$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = ''
  url64bit       = 'https://s3.amazonaws.com/authy-electron-repository-production/authy/stable/1.6.0/win32/x64/Authy%20Desktop%20Setup%201.6.0.exe'
  softwareName   = 'Authy Desktop*'
  checksum       = ''
  checksumType   = ''
  checksum64     = 'e22ccd17bb220ad03bcbbd4ed9dda41a297c2af6956114409907bab9945360ed2ee454d303f5ce62f1cf0a19a62727db8613af0228c6f059d01186bddb8a7acb'
  checksumType64 = 'sha512'
  silentArgs     = '-s'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
