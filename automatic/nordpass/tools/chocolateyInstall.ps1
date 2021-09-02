$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$installDir = Join-Path $(Get-ToolsLocation) "NordPass"

$packageArgs = @{
  packageName    = $env:chocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = 'https://downloads.npass.app/windows_x86/NordPassSetup_x86.exe'
  url64bit       = 'https://downloads.npass.app/windows/NordPassSetup.exe'

  softwareName   = 'NordPass*'

  checksum       = '1A3779EF28B17EB6C4B2871BFF05BFD162E8B6BFE578898B4A57DC352D9F8D30F5439C6617DC59E5CB15CE007886EDA0CC1CA2869AA04C1EEA8362CA4DA59835'
  checksumType   = 'sha512'
  checksum64     = 'F89355507AE7A8AD91F6D2FB91038A9DA67D117BCA17B02AD512838E3A02CF6ABC7F2957A0227D8E80CD3277B1C173CAFCDE597DE0AA7EA1E60FCBEE0B7A5FE5'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
