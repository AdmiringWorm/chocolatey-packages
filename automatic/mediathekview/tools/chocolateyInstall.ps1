$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsPath\MediathekView-13.0.6.zip"
  destination = $toolsPath
}

Get-ChocolateyUnzip @packageArgs
rm $toolsPath\*.zip -ea 0

Get-ChildItem "$toolsPath" "*.exe" -Recurse | % {
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
