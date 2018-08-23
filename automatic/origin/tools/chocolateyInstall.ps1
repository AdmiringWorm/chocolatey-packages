$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsDir\helpers.ps1"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  url          = 'https://download.dm.origin.com/origin/live/OriginSetup.exe'
  softwareName = 'Origin*' # Probably not needed, but we add registry keys so we keep it
  checksum     = '87FE455DCD23134BE6B933E8BBD084D03E1D6F6FA511F71468AA8C9B3E78EF6E8AA1F4339F9404C434C8B88EA100DD9540A2ED4213B0FDF7CDF8522928BB0C76'
  checksumType = 'sha512'
  destination  = Get-PackageCacheLocation
}

if ($env:ChocolateyForce -ne $true) {
  try {
    $InstalledVersion = Get-UninstallRegistryKey $packageArgs['softwareName'] | Select-Object -First 1 -Expand 'DisplayVersion'

    if ([Version]::Parse($InstalledVersion) -ge [Version]::Parse('10.5.25.7131'))
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
  CreateRegistrySettings -installPath $packageArgs['destination'] -autoUpdate $false -version '10.5.25.7131'
}
else {
  CreateRegistrySettings -installPath $packageArgs['destination'] -autoUpdate $true -version '10.5.25.7131'
}

Get-ChocolateyUnzip @packageArgs

CreateShortcuts -pp $pp -installDir $packageArgs['destination']

if ($pp.LaunchOrigin -or $pp.StartOrigin) {
  $exe = "$($packageArgs["destination"])\Origin.exe"
  Start-Process $exe
}
