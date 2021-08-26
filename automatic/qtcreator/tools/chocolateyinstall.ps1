$ErrorActionPreference = 'Stop'

$installToolsPath = Get-ToolsLocation

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://download.qt.io/official_releases/qtcreator/5.0/5.0.0/installer_source/windows_x86/qtcreator.7z'
  url64bit       = 'https://download.qt.io/official_releases/qtcreator/5.0/5.0.0/installer_source/windows_x64/qtcreator.7z'
  destination    = "$installToolsPath\$env:ChocolateyPackageName"
  checksum       = '9390b00063c980a263f3e9baee93e44de39f357532600eb69e3f35ebe81071c3'
  checksumType   = 'sha256'
  checksum64     = 'b230c838401df7ad0298a1088542d23e0f035f19d59f02d73f3bfa598de0c16a'
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
