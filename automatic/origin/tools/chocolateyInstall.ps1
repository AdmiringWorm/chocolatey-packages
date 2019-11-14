$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsDir\helpers.ps1"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  url          = 'https://download.dm.origin.com/origin/live/OriginSetup.exe'
  softwareName = 'Origin*' # Probably not needed, but we add registry keys so we keep it
  checksum     = 'D08A1F0484731D160BC0D35BBBCD22E1000891E0ED46EFE2B86EC5E9CF0AEFD04215402630A03059D7D1CF631FDC59024099EA64149FFC6B96DE79DB38C5BEF0'
  checksumType = 'sha512'
  destination  = Get-PackageCacheLocation
}

if ($env:ChocolateyForce -ne $true) {
  try {
    $InstalledVersion = Get-UninstallRegistryKey $packageArgs['softwareName'] | Select-Object -First 1 -Expand 'DisplayVersion'

    if ([Version]::Parse($InstalledVersion) -ge [Version]::Parse('10.5.55.33574'))
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
  CreateRegistrySettings -installPath $packageArgs['destination'] -autoUpdate $false -version '10.5.55.33574'
}
else {
  CreateRegistrySettings -installPath $packageArgs['destination'] -autoUpdate $true -version '10.5.55.33574'
}

Get-ChocolateyUnzip @packageArgs

CreateShortcuts -pp $pp -installDir $packageArgs['destination']

if ($pp.LaunchOrigin -or $pp.StartOrigin) {
  $exe = "$($packageArgs["destination"])\Origin.exe"
  Start-Process $exe
}
