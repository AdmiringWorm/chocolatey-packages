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

  checksum       = '05BD3BB86E4384F33D286F8126C169BFEBB1600030427536B21FDEAACBAFA5A59032682257945A662B54E199C6098FF2D87B145012CDD1CD0C2747557F18D020'
  checksumType   = 'sha512'
  checksum64     = '6E86619BBD81CE8961CAF3551C01B909B0AD2BF9F9B9A59CAF7220E19CE2731404A5DE368231DD39F287DF8F0BAA865E1FC19C1ECC51A3D31003ADBD8378C1BF'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
