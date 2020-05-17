$ErrorActionPreference = 'Stop'

if ((Get-OSArchitectureWidth 32) -or $env:ChocolateyForceX86) {
  throw "The SheepIt windows client does not support 32bit windows..."
}

# Check if the sheepit process is running
$runningProcess = Get-Process -Name "sheepit*"
if ($runningProcess) {
  # We can't try closing it, as the main program is detected as 'OpenJDK'
  throw "The SheepIt client is running, please close it before trying to install/upgrade a new version."
}

$packageToolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
$packageClientPath = "$packageToolsPath\sheepit-6.1721.0.exe"
$toolsPath = Join-Path (Get-ToolsLocation) $env:ChocolateyPackageName
$clientOutputPath = "$toolsPath\sheepit.exe"

if (!(Test-path $toolsPath)) {
  Write-Host "Creating $env:ChocolateyPackageName tools directory..."
  mkdir $toolsPath -Force
}
Write-Host "Moving $env:ChocolateyPackageName executable to tools directory..."
Move-Item -Path $packageClientPath $clientOutputPath -Force

Write-Host "Registering $env:ChocolateyPackageName to App Paths..."
Register-Application "$clientOutputPath"
Write-Host "$env:ChocolateyPackageName registered as $(Split-Path -Leaf $clientOutputPath)"

$pp = Get-PackageParametersBuiltIn

if (!$pp['NoStartMenu']) {
  Write-Host "Creating $env:ChocolateyPackageName Start Menu icon..."
  $startMenu = [System.Environment]::GetFolderPath("CommonStartMenu")
  Install-ChocolateyShortcut `
    -ShortcutFilePath "$startMenu\SheepIt Client.lnk" `
    -TargetPath $clientOutputPath
}

if ($pp['Desktop']) {
  Write-Host "Creating $env:ChocolateyPackageName Desktop icon..."
  $desktop = [System.Environment]::GetFolderPath("CommonDesktopDirectory")
  Install-ChocolateyShortcut `
    -ShortcutFilePath "$desktop\SheepIt Client.lnk" `
    -TargetPath $clientOutputPath
}
