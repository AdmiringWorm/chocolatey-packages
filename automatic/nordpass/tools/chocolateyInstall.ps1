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

  checksum       = '95DB0DEEF9BF92205911E380C1618681C581A3384104D916E49862DFA65CFC7E5BE0C6819BEA3D8E400EBD4B5E66C54310B41B834F383EEBF6125133E1B37D68'
  checksumType   = 'sha512'
  checksum64     = '27E267221E380E0C27F949425A2B3A97A9BB52D979D117C38550F25A0AAB6BADBE3F77803A49ADB3B8269F41EC9DC9A8032D35E1285A5BB13D563B69CAF25CCC'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
