$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsDir\helpers.ps1"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  url          = 'https://download.dm.origin.com/origin/live/OriginSetup.exe'
  softwareName = 'Origin*' # Probably not needed, but we add registry keys so we keep it
  checksum     = '261FABF7A1E56DC9F8280C6A6C87C5A48B1D02D3D665FF3416104F44C8A903EBE804609F406F7CB53ACE968E1CB3D46667492F6F77AA95692C14D3D54F53C1AA'
  checksumType = 'sha512'
  destination  = Get-PackageCacheLocation
}

if ($env:ChocolateyForce -ne $true) {
  try {
    $InstalledVersion = Get-UninstallRegistryKey $packageArgs['softwareName'] | Select-Object -First 1 -Expand 'DisplayVersion'

    if ([Version]::Parse($InstalledVersion) -ge [Version]::Parse('10.5.35.22222'))
    {
      Write-Host "Skipping installation because version $InstalledVersion is already installed."
      return
    }
  } catch {
    # Installed version couldn't be checked, attempt installation
  }
}

Install-ChocolateyZipPackage @packageArgs

$pp = Get-PackageParameters
$zipFile = Get-ChildItem "$($packageArgs['destination'])" "*.zip" -Recurse | Select-Object -first 1 -expand FullName
$packageArgs['file'] = $zipFile
$packageArgs['destination'] = GetInstallLocation $pp

if ($pp.NoAutoUpdate) {
  CreateRegistrySettings -installPath $packageArgs['destination'] -autoUpdate $false -version '10.5.35.22222'
}
else {
  CreateRegistrySettings -installPath $packageArgs['destination'] -autoUpdate $true -version '10.5.35.22222'
}

Get-ChocolateyUnzip @packageArgs

CreateShortcuts -pp $pp -installDir $packageArgs['destination']

if ($pp.LaunchOrigin -or $pp.StartOrigin) {
  $exe = "$($packageArgs["destination"])\Origin.exe"
  Start-Process $exe
}
