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
  url            = 'https://downloads.nordteams.com/win/latest/NordVPNTeamsSetup.exe'
  softwareName   = 'NordVPN Teams*'
  checksum       = 'FA21581880287DD5E0D2C9A970492AE4EE651665C69FC1BA1B79DDF24B216D06A3BBD4DA8B68AF5D393E50FF8041F5301F13448A3432E42D08D09FD544A64352'
  checksumType   = 'sha512'
  silentArgs     = "/exenoui /exenoupdates /qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
