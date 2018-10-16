$ErrorActionPreference = 'Stop'

$desktopLink = "$([System.Environment]::GetFolderPath('DesktopDirectory'))\$env:ChocolateyPackageName.lnk"

if (Test-Path $desktopLink) {
  Remove-Item -force -ea 0 $desktopLink
}

Write-Warning "If MediaThekView was installed to a custom directory, this needs to be cleaned up manually..."
