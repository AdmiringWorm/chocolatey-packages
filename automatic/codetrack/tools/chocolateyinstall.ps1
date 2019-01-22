$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageName = $env:ChocolateyPackageName

$packageArgs = @{
  destination = $toolsPath
  packageName = $packageName
  file        = "$toolsPath\codetrack_1_0_3_3.zip"
}

$outputDir = Get-ChocolateyUnzip @packageArgs

$target = "$outputDir\CodeTrack.exe"
Remove-Item $packageArgs.file -Force -ea 0

if (Test-Path $target) {
  $startMenu = [System.Environment]::GetFolderPath('Programs')
  New-Item -ItemType File -Path "$target.gui" | Out-Null
  Install-ChocolateyShortcut "$startMenu\CodeTrack.lnk" -TargetPath $target

  Register-Application "$target"
  Write-Host "$packageName registered as CodeTrack"
}
else {
  Write-Warning "Can't find $PackageName install location"
}
