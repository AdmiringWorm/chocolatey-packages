$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '464102696E35AFF1BA4238BA5BF7B214B9446B1EB17E793AC81F0D65637FEE2DE5A17C7D7CCEC02A9712C427A528427F370FC56A0474E97B76BAA5EE59D914D4'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
