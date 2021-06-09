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
  checksum       = '3CCFB404058B7478D4EE2E351C2CCFC41722B803E7414B9C603FB1E4A4D3134755919B53FAB13988C3146430544AB137E3B3998690D70E58EC5AD0FFD6DEB9DD'
  checksumType   = 'sha512'
  silentArgs     = "/SILENT /SUPPRESSMSGBOXES /NORESTART /SP- /ALLUSERS /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName)\$($env:chocolateyPackageVersion)\install.log`""
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
