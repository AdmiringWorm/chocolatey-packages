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
  checksum       = '04C21191733EFF6AEE7B4CD576768B5E15E83864B753E6E5BAC74D099586562C9EDCFEAFDEA4879E33662E43F667CA4EE8C60543574499978E83256DE3ECAD7A'
  checksumType   = 'sha512'
  silentArgs     = "/exenoui /exenoupdates /qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
