$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-3.14.1/ioninja-3.14.1-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-3.14.1/ioninja-3.14.1-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = 'e904ab1bbd147132aa6adc28dbd9187915da756fe084dcc56cfc10de45338912b14736949019c06297f5dd3a6547f67ca743d10b04c6e00ca6888e46508d5d3a'
  checksumType   = 'sha512'
  checksum64     = '238805af5d47c24c80d61be3aacc5bf9d26d771e1cba6c67352cd3895abe03d7b0fa87299c7ab3a9f5ea5433277d4f19783e52742579821a1381cbf951e67735'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
