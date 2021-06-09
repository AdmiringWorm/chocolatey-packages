$ErrorActionPreference = 'Stop'

$installToolsPath = Get-ToolsLocation

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://download.qt.io/official_releases/qtcreator/4.15/4.15.1/installer_source/windows_x86/qtcreator.7z'
  url64bit       = 'https://download.qt.io/official_releases/qtcreator/4.15/4.15.1/installer_source/windows_x64/qtcreator.7z'
  destination    = "$installToolsPath\$env:ChocolateyPackageName"
  checksum       = 'a82ef4b8dcd577be3cebe1380051747f73b22247ec4e6117cc67962c675759c5'
  checksumType   = 'sha256'
  checksum64     = '62ade7584fbf3389b0058de3f6fbbe910e204d494862c638d1237da8be00ea38'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$qtCreator = $null

Get-ChildItem $packageArgs.destination -Include "*.exe" -Recurse | ForEach-Object {
  if ($_.Name -eq "qtcreator.exe") {
    Set-Content -Value "" -LiteralPath "$($_.FullName).gui"
    $qtCreator = $_.FullName
  }
  else {
    Set-Content -Value "" -LiteralPath "$($_.FullName).ignore"
  }
}

if ($qtCreator) {
  # Because chocolatey targets 4.0, we are able to use 'Programs' in the 'GetFolderPath'
  $programs = [System.Environment]::GetFolderPath("Programs")
  Install-ChocolateyShortcut -shortcutFile "$programs\QT Creator.lnk" -targetPath $qtCreator
  Install-ChocolateyFileAssociation ".pro" $qtCreator
} else {
  Write-Warning "Unable to find qtcreator executable, skipping start menu shortcut creation!"
}
