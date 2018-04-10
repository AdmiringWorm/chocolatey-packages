$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsDir\helpers.ps1"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  url          = 'https://download.dm.origin.com/origin/live/OriginSetup.exe'
  softwareName = 'Origin*' # Probably not needed, but we add registry keys so we keep it
  checksum     = 'B3C590F6E79B0636CCFC483FA67D0A7136AB3A2B03990B64555FD95AB569F7E68659516B9C6E9D3CBBDEE25BF63A939091538AE037FA49115FB201B61BC26FE4'
  checksumType = 'sha512'
  destination  = Get-PackageCacheLocation
}

Install-ChocolateyZipPackage @packageArgs

$pp = Get-PackageParameters
$zipFile = Get-ChildItem "$($packageArgs['destination'])" "*.zip" -Recurse | Select-Object -first 1 -expand FullName
$packageArgs['file'] = $zipFile
$packageArgs['destination'] = GetInstallLocation $pp

if ($pp.NoAutoUpdate) {
  CreateRegistrySettings -installPath $packageArgs['destination'] -autoUpdate $false -version '10.5.16.49299'
}
else {
  CreateRegistrySettings -installPath $packageArgs['destination'] -autoUpdate $true -version '10.5.16.49299'
}

Get-ChocolateyUnzip @packageArgs

CreateShortcuts -pp $pp -installDir $packageArgs['destination']

Write-Host "Removing cached unzipped directory..."
Uninstall-ChocolateyZipPackage -packageName $packageArgs['packageName'] -zipFileName ($packageArgs.url -split '\/' | Select-Object -last 1)

if ($pp.LaunchOrigin -or $pp.StartOrigin) {
  $exe = "$($packageArgs["destination"])\Origin.exe"
  Start-Process $exe
}
