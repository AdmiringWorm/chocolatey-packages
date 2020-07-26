$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificates..."
$certificates = gci "$toolsPath\*.cer"
$certificates | % {
  Import-Certificate -FilePath $_ -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"
}

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://downloads.nordcdn.com/apps/windows/10/NordVPN/6.31.5/NordVPNSetup.exe'
  softwareName   = 'NordVPN*'
  checksum       = 'A4A751D0FCCF26A8B7DCB926452171A10ABE094164155FD9ED46B097991704EA97D733A50F4CFDBA268769E3A2E738EC562479787429C57264EE0C4471DD8297'
  checksumType   = 'sha512'
  silentArgs     = "/SILENT /SUPPRESSMSGBOXES /NORESTART /SP- /ALLUSERS /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName)\$($env:chocolateyPackageVersion)\install.log`""
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
