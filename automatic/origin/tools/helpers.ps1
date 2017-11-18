function GetInstallLocation() {
  param($pp)

  # First check if origin is already installed
  $installPath = GetInstallLocationFromRegistry

  if ($installPath) { return $installPath }
  elseif ($pp.InstallDir) { return $pp.InstallDir }
  elseif (Get-ProcessorBits -Compare 32) { return "C:\Program Files\Origin" }
  else { return "C:\Program Files (x86)\Origin" }
}

function GetInstallLocationFromRegistry() {
  $key = Get-UninstallRegistryKey -SoftwareName 'Origin' | select -first 1

  if ($key) {
    return $key.InstallLocation
  }
}

function CreateRegistrySettings() {
  param([string]$installPath, [bool]$autoUpdate, [string]$version)
  if ($installPath.EndsWith('\')) {
    $installPath = $installPath.TrimEnd('\')
  }

  $originSettings = @{
    AutopatchGlobal = 'true'
    Autoupdate = if ($autoUpdate) { 'true' } else { 'false' }
    ClientPath = "$installPath\Origin.exe"
    ClientVersion = $version
    InstallSuccesfull = 'true'
    IsBeta = 'false'
    TelemOO = 'false'
  }

  $uninstallSettings = @{
    DisplayIcon = "$installPath\OriginUninstall.exe"
    DisplayName = 'Origin'
    DisplayVersion = $version
    InstallLocation = $installPath
    Publisher = 'Electronic Arts, Inc.'
    UninstallString = "$installPath\OriginUninstall.exe"
    URLInfoAbout = 'http://www.ea.com'
  }

  if (Get-ProcessorBits -Compare 32) {
    $originRegPath = 'HKLM:\SOFTWARE\Origin'
    $uninstallRegPath = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Origin'
  } else {
    $originRegPath = 'HKLM:\SOFTWARE\WOW6432Node\Origin'
    $uninstallRegPath = 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Origin'
  }

  if (!(Test-Path $originRegPath)) {
    New-Item -Path $originRegPath -Force | Out-Null
  }
  if (!(Test-Path $uninstallRegPath)) {
    New-Item -Path $uninstallRegPath -Force | Out-Null
  }

  Write-Host "Creating/Updating Origin Client registry settings..."
  $originSettings.Keys | % {
    New-ItemProperty -Path $originRegPath -Name $_ -Value $originSettings[$_] -Force | Out-Null
  }

  Write-Host "Creating/Updating Origin Client uninstall registry settings..."
  $uninstallSettings.Keys | % {
    New-ItemProperty -Path $uninstallRegPath -Name $_ -Value $uninstallSettings[$_] -Force | Out-Null
  }
}
