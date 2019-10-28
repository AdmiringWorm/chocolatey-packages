$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsDir\helpers.ps1"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  url          = 'https://download.dm.origin.com/origin/live/OriginSetup.exe'
  softwareName = 'Origin*' # Probably not needed, but we add registry keys so we keep it
  checksum     = '592169AF87E69EA23B318EA29492A6111DC6A42BCF7E589097D666C026C30CC98930F330AC7CC8A6374234278ED38041C2AA5658B24A0CBDF7F02D83569DB968'
  checksumType = 'sha512'
  destination  = Get-PackageCacheLocation
}

if ($env:ChocolateyForce -ne $true) {
  try {
    $InstalledVersion = Get-UninstallRegistryKey $packageArgs['softwareName'] | Select-Object -First 1 -Expand 'DisplayVersion'

    if ([Version]::Parse($InstalledVersion) -ge [Version]::Parse('10.5.52.32372'))
    {
      Write-Host "Skipping installation because version $InstalledVersion is already installed."
      return
    }
  } catch {
    # Installed version couldn't be checked, attempt installation
    Write-Warning "Unable to check for existing origin version, assuming it do not exist..."
  }
}

Install-ChocolateyZipPackage @packageArgs

$pp = Get-PackageParameters
$zipFile = Get-ChildItem "$($packageArgs['destination'])" "*.zip" -Recurse | Select-Object -first 1 -expand FullName
$packageArgs['file'] = $zipFile
$packageArgs['destination'] = GetInstallLocation $pp

if ($pp.NoAutoUpdate) {
  CreateRegistrySettings -installPath $packageArgs['destination'] -autoUpdate $false -version '10.5.52.32372'
}
else {
  CreateRegistrySettings -installPath $packageArgs['destination'] -autoUpdate $true -version '10.5.52.32372'
}

Get-ChocolateyUnzip @packageArgs

CreateShortcuts -pp $pp -installDir $packageArgs['destination']

if ($pp.LaunchOrigin -or $pp.StartOrigin) {
  $exe = "$($packageArgs["destination"])\Origin.exe"
  Start-Process $exe
}
