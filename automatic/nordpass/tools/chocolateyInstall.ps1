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

  checksum       = 'F4488C30DB27BEE419AFA649188A21538ABB147EDE617D2C3C6B747CC12E201AED1EC719437CA0A9C9895C4F608088F60A44E3AD697738040B7D1B853F7FBCE9'
  checksumType   = 'sha512'
  checksum64     = '3589326A5A23D4DD9FB6CCC21B45FBFDE48B826AA7A5193582C2C5D692B3F9F777C4BEE08853B289CF7B72F63087EAC848CB7DD56F389BBC185FA497526A9ABD'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
