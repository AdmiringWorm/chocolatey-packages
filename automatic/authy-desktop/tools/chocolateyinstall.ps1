$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = ''
  url64bit       = 'https://pkg.authy.com/authy/stable/2.3.0/win32/x64/Authy%20Desktop%20Setup%202.3.0.exe'
  softwareName   = 'Authy Desktop*'
  checksum       = ''
  checksumType   = ''
  checksum64     = '8dfb35a7aa051ff4ac0a0d3da6347b7fa1f6a4f335a9256c336991422eda2f2a7fcad57ceb15bbda0720346cb90558daf800809166a2209b0f749b79cc3e6a42'
  checksumType64 = 'sha512'
  silentArgs     = '-s -ju'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
