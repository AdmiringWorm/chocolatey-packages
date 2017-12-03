$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition
$installToolsPath = Get-ToolsLocation

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsPath\qtcreator_x32.7z"
  file64      = "$toolsPath\qtcreator_x64.7z"
  destination = "$installToolsPath\$env:ChocolateyPackageName"
}

Get-ChocolateyUnzip @packageArgs

Get-ChildItem $packageArgs.destination -Include "*.exe" -Recurse | % {
  if ($_.Name -eq "qtcreator.exe") {
    Set-Content -Value "" -LiteralPath "$($_.FullName).gui"
    $qtCreator = $_.FullName
  }
  else {
    Set-Content -Value "" -LiteralPath "$($_.FullName).ignore"
  }
}

# Because chocolatey targets 4.0, we are able to use 'Programs' in the 'GetFolderPath'
$programs = [System.Environment]::GetFolderPath("Programs")

Install-ChocolateyShortcut -shortcutFile "$programs\QT Creator.lnk" -targetPath $qtCreator
Install-ChocolateyFileAssociation ".pro" $qtCreator
