$ErrorActionPreference = 'Stop'; # stop on all errors

$startMenu = [System.Environment]::GetFolderPath('Programs')
if (Test-Path "$startMenu\CodeTrack.lnk") { Remove-Item -Force "$startMenu\CodeTrack.lnk" }
