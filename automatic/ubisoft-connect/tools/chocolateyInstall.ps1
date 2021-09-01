$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '727AD5183369642E49D9EF0D5C79DBE88F71C706C07684EC0B8042DFBFDBF305D01C5517772A776DEB9B94A1D09BB57E9BCA1AB6C84042017AEFB72935A56A0F'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
