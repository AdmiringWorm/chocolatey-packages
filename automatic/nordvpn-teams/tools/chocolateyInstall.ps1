$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificates..."
$certificates = Get-ChildItem "$toolsPath\*.cer"
$certificates | ForEach-Object {
  Import-Certificate -FilePath $_ -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"
}

$packageArgs = @{
  packageName    = $env:chocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = 'https://downloads.nordlayer.com/win/latest/NordLayerSetup.exe'
  softwareName   = 'NordVPN Teams*'
  checksum       = '2791A856FA2813B735C9CF81104D6E88A920CD0E0A1F5A24CE1049041726B9D6D0D7F9950B6B4D633E17AC08EDC51C1469A4E066997973D6243E7D54B16F094A'
  checksumType   = 'sha512'
  silentArgs     = "/exenoui /exenoupdates /qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
