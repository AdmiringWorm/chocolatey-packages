﻿$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsDir\helpers.ps1"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  url          = 'https://download.dm.origin.com/origin/live/OriginSetup.exe'
  softwareName = 'Origin*' # Probably not needed, but we add registry keys so we keep it
  checksum     = '95D62D6B4641F8E1EBBBD0CA99F4C9C0FB6F4A3B9D01841411ED3890D726BD5815F384EAE726E896143D5FB17999868C892A49B1D0F4253FC0C6F4AF86798E81'
  checksumType = 'sha512'
  destination  = Get-PackageCacheLocation
}

if ($env:ChocolateyForce -ne $true) {
  try {
    $InstalledVersion = Get-UninstallRegistryKey $packageArgs['softwareName'] | Select-Object -First 1 -Expand 'DisplayVersion'

    if ([Version]::Parse($InstalledVersion) -ge [Version]::Parse('10.5.78.42537'))
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
  CreateRegistrySettings -installPath $packageArgs['destination'] -autoUpdate $false -version '10.5.78.42537'
}
else {
  CreateRegistrySettings -installPath $packageArgs['destination'] -autoUpdate $true -version '10.5.78.42537'
}

Get-ChocolateyUnzip @packageArgs

CreateShortcuts -pp $pp -installDir $packageArgs['destination']

if ($pp.LaunchOrigin -or $pp.StartOrigin) {
  $exe = "$($packageArgs["destination"])\Origin.exe"
  Start-Process $exe
}
