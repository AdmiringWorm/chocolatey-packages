$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificates..."
$certificates = Get-ChildItem "$toolsPath\*.cer"
$certificates | ForEach-Object {
  Import-Certificate -FilePath $_ -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"
}

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://downloads.nordcdn.com/apps/windows/10/NordVPN/latest/NordVPNSetup.exe'
  softwareName   = 'NordVPN*'
  checksum       = '2758017E390E3D6AFF3B7AB8EB6E472570C3BCF403EE37D7CA8FBE6B2CE99E6E017C4C23104CC73B0A449774DAABF01F43C9055D6A177C6A0602090EDAB7A1A8'
  checksumType   = 'sha512'
  silentArgs     = "/SILENT /SUPPRESSMSGBOXES /NORESTART /SP- /ALLUSERS /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName)\$($env:chocolateyPackageVersion)\install.log`""
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
