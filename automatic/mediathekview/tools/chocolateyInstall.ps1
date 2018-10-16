$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition
$installPath = $toolsPath

$pp = Get-PackageParameters

if ($pp.InstallDir) {
  $installPath = $pp.InstallDir
}

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsPath\MediathekView-13.2.1.zip"
  destination = $installPath
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
