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

  checksum       = '5C2FC0F76F4A1D1BD379F93D6B91A50218BC4DD2C22EC8B76D54201C3786E4BA03816E2A95FA05F34E5A5B2EDDD9712FBBDB4778E617D039AAE919AFFEC8335B'
  checksumType   = 'sha512'
  checksum64     = 'B704B81A158FBB7F1063DFFF50E2FA1F4E89D1A452507496D96FA378877C314F7B9EC9376B5AA8F7D75D3A2A928D6BD49F1FF0B3E4F1EC2567AC4ECFCDF1D044'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
