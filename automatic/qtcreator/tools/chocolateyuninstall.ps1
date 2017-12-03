$ErrorActionPreference = 'Stop'

# Remove the start menu shortcut
$startMenu = [System.Environment]::GetFolderPath('Programs')
if (Test-Path "$startMenu\QT Creator.lnk") {
  Remove-Item -Force "$startMenu\QT Creator.lnk"
}

$hkey = "HKCR:\.pro"
if (Test-Path $hkey) {
  Remove-Item -Force $hkey
}
