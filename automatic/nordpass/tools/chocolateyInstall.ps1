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

  checksum       = '4A3EF9D92D59A8C13CF94C683D1B2D7E050F6BC0F02BAFE146F46C85FA5D65DA5F059D267E6C6599B68ADC699B541238642C42B5856FAF4BE6C8BA0E46D7E1BD'
  checksumType   = 'sha512'
  checksum64     = 'F885D1DAC7B2DD138E0B7DDFEA189C3AF2B7C4B87F2188DE4740DF1B06A21EE79B51A2B2D58BDD48FBA9B029CD78F1D96DF11C724D39BA6AC26CF395207B0042'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
