$ErrorActionPreference = 'Stop'

$desktopLink = "$([System.Environment]::GetFolderPath('DesktopDirectory'))\$env:ChocolateyPackageName.lnk"

if (Test-Path $desktopLink) {
  rm -force -ea 0 $desktopLink
}
