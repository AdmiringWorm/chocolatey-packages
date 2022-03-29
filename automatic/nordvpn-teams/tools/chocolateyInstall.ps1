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
  checksum       = 'F3456E59BAA8FC54C2586FB21A726CE1039CDE9ACDF09D1E4E204B7873B2D9B09F02A28B0E304EB09679B073432946F36ACFF6A283C6ACA3071FB82377ADDF13'
  checksumType   = 'sha512'
  silentArgs     = "/exenoui /exenoupdates /qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
