$ErrorActionPreference = 'Stop'

# Remove the start menu shortcut
$startMenu = [System.Environment]::GetFolderPath('Programs')
if (Test-Path "$startMenu\Qt Creator.lnk") {
  Remove-Item -Force "$startMenu\Qt Creator.lnk"
}

$hkey = "HKCR:\.pro"
if (Test-Path $hkey) {
  Remove-Item -Force $hkey
}
