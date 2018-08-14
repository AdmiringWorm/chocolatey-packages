$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsPath\MediathekView-13.1.3.zip"
  destination = $toolsPath
}

Get-ChocolateyUnzip @packageArgs
Remove-Item $toolsPath\*.zip -ea 0

Get-ChildItem "$toolsPath" "*.exe" -Recurse | ForEach-Object {
  if ($_.Name -eq 'MediathekView.exe') {
    $desktopLink = "$([System.Environment]::GetFolderPath('DesktopDirectory'))\$env:ChocolateyPackageName.lnk"
    Install-ChocolateyShortcut -shortcutFilePath "$desktopLink" `
                               -targetPath $_.FullName `
                               -workingDirectory $_.DirectoryName
    Set-Content -Value '' -Path "$($_.FullName).gui"
  } else {
    Set-Content -Value '' -Path "$($_.FullName).ignore"
  }
}
