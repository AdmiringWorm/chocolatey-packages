$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsDir\helpers.ps1"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://download.dm.origin.com/origin/live/OriginSetup.exe'
  softwareName   = 'Origin*' # Probably not needed, but we add registry keys so we keep it
  checksum       = 'B9E3F69CA53B694DB38CD1D65E4C9A0CAFC3F3FA49364044BD442408C3851D73'
  checksumType   = 'sha256'
  destination    = Get-PackageCacheLocation
}

Install-ChocolateyZipPackage @packageArgs

$pp = Get-PackageParameters
$zipFile = Get-ChildItem "$($packageArgs['destination'])" "*.zip" -Recurse | select -first 1 -expand FullName
$packageArgs['file'] = $zipFile
$packageArgs['destination'] = GetInstallLocation $pp

if ($pp.NoAutoUpdate) {
  CreateRegistrySettings -installPath $packageArgs['destination'] -autoUpdate $false -version '10.5.6.6235'
} else {
  CreateRegistrySettings -installPath $packageArgs['destination'] -autoUpdate $true -version '10.5.6.6235'
}

Get-ChocolateyUnzip @packageArgs

Write-Host "Removing cached unzipped directory..."
Uninstall-ChocolateyZipPackage -packageName $packageArgs['packageName'] -zipFileName ($packageArgs.url -split '\/' | select -last 1)

if ($pp.LaunchOrigin -or $pp.StartOrigin) {
  $exe = "$($packageArgs["destination"])\Origin.exe"
  Start-Process $exe
}
