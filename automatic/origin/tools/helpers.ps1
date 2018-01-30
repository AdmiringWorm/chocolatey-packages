function GetInstallLocation() {
  param($pp)

  # First check if origin is already installed
  $installPath = GetInstallLocationFromRegistry

  if ($installPath) { return $installPath }
  elseif ($pp.InstallDir) { return $pp.InstallDir }
  elseif (Get-OSArchitectureWidth -Compare 32) { return "C:\Program Files\Origin" }
  else { return "C:\Program Files (x86)\Origin" }
}

function GetInstallLocationFromRegistry() {
  $key = Get-UninstallRegistryKey -SoftwareName 'Origin' | Select-Object -first 1

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
    AutopatchGlobal   = 'true'
    Autoupdate        = if ($autoUpdate) { 'true' } else { 'false' }
    ClientPath        = "$installPath\Origin.exe"
    ClientVersion     = $version
    InstallSuccesfull = 'true'
    IsBeta            = 'false'
    TelemOO           = 'false'
  }

  $uninstallSettings = @{
    DisplayIcon     = "$installPath\OriginUninstall.exe"
    DisplayName     = 'Origin'
    DisplayVersion  = $version
    InstallLocation = $installPath
    Publisher       = 'Electronic Arts, Inc.'
    UninstallString = "$installPath\OriginUninstall.exe"
    URLInfoAbout    = 'http://www.ea.com'
  }

  if (Get-OSArchitectureWidth -Compare 32) {
    $originRegPath = 'HKLM:\SOFTWARE\Origin'
    $uninstallRegPath = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Origin'
  }
  else {
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
  $originSettings.Keys | ForEach-Object {
    New-ItemProperty -Path $originRegPath -Name $_ -Value $originSettings[$_] -Force | Out-Null
  }

  Write-Host "Creating/Updating Origin Client uninstall registry settings..."
  $uninstallSettings.Keys | ForEach-Object {
    New-ItemProperty -Path $uninstallRegPath -Name $_ -Value $uninstallSettings[$_] -Force | Out-Null
  }
}

function CreateShortcuts() {
  param($pp, $installDir)

  $originExec = Resolve-Path "$installDir/origin.exe"

  if (!($pp.NoStartMenuIcon)) {
    $startMenu = [System.Environment]::GetFolderPath('CommonPrograms')
    $link = "$startMenu\Origin.lnk"

    Write-Host "Creating Origin Start Menu shortcut..."
    Install-ChocolateyShortcut -ShortcutFilePath $link -TargetPath $originExec
  }

  if ($pp.DesktopIcon) {
    $desktop = [System.Environment]::GetFolderPath("CommonDesktop")
    $link = "$desktop\Origin.lnk"

    Write-Host "Creating Origin Desktop shortcut..."
    Install-ChocolateyShortcut -ShortcutFilePath $link -TargetPath $originExec
  }
}

function RemoveShortcuts() {
  @(
    [System.Environment]::GetFolderPath('CommonPrograms')
    [System.Environment]::GetFolderPath('CommonDesktop')
  ) | ForEach-Object {
    if (Test-Path "$_\Origin.lnk") { Remove-Item -Force "$_\Origin.lnk" }
  }
}
