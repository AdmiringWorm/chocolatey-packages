$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = ''
  url64bit       = 'https://pkg.authy.com/authy/stable/3.0.0/win32/x64/Authy%20Desktop%20Setup%203.0.0.exe'
  softwareName   = 'Authy Desktop*'
  checksum       = ''
  checksumType   = ''
  checksum64     = '369b8f9b710a5d93c3dd702d3a870a77092a143974f9b837fe2ec86970029feec5cbddc782d47c19280c05aff0d75e52997bb0d60f48a498ef2413e2d182e384'
  checksumType64 = 'sha512'
  silentArgs     = '-s -ju'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
